//
//  CharacterDetailsVC.swift
//  RickMorty
//
//  Created by German Hernandez on 26/01/2020.
//  Copyright © 2020 German Hernandez. All rights reserved.
//

import UIKit

protocol CharacterDetailsVCDelegate: class {
    func didTapLocation(for character: Character)
    func didTapEpisodes(for character: Character)
}

class CharacterDetailsVC: UIViewController {
    
    let headerView      = UIView()
    let itemViewOne     = UIView()
    let itemViewTwo     = UIView()
    
    var characterID: Int!
    var itemViews: [UIView] = []
    
    weak var delegate: CharacterDetailsVCDelegate!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        layoutUI()
        getCharacterInfo()
        isCharacterFavorited()
    }
    
    
    // MARK: - Methods

    func configureViewController() {
        title                   = "Character Details"
        view.backgroundColor    = .systemBackground
        
        let leftButton  = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissVC))
        navigationItem.leftBarButtonItem  = leftButton
        
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    
    func isCharacterFavorited() {
        PersistenceManager.isFavorited(characterID: characterID) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let isFavorited):
                DispatchQueue.main.async {
                    let rightIcon = isFavorited ? SFSymbols.favorite : SFSymbols.unfavorited
                    
                    let rightButton = UIBarButtonItem(image: UIImage(systemName: rightIcon), style: .plain, target: self, action: #selector(self.onRightButtonPressed))
                           
                    self.navigationItem.rightBarButtonItem = rightButton
                }
            case .failure(let error):
                self.presentRMAlert(title: "Something went wrong", message: error.rawValue, buttonTitle: "Dismiss")
            }
        }
    }
    
    
    @objc func onRightButtonPressed() {
        showLoadingView()
        
        NetworkManager.shared.getCharacter(for: characterID) { [weak self] result in
            guard let self = self else { return }
            
            self.dismissLoadingView()
            
            switch result {
            case .success(let character):
                PersistenceManager.updateWith(favorite: character, actionType: .add) { [weak self] error in
                    guard let self = self else { return }
                    
                    guard let error = error else {
                        self.isCharacterFavorited()
                        self.presentRMAlert(title: "Success", message: "You have successfully favorited this character.", buttonTitle: "Ok")
                        return
                    }
                    
                    self.presentRMAlert(title: "Something went wrong", message: error.rawValue, buttonTitle: "Dismiss")
                }
                
            case .failure(let error):
                self.presentRMAlert(title: "Something went wrong", message: error.rawValue, buttonTitle: "Dismiss")
            }
        }
    }
    
    
    func configureUIElements(with character: Character) {
        let locationInfoVC = RMLocationInfoVC(character: character)
        let episodesInfoVC = RMEpisodesInfoVC(character: character)
        
        locationInfoVC.delegate = self
        episodesInfoVC.delegate = self
        
        add(childVC: locationInfoVC, to: itemViewOne)
        add(childVC: episodesInfoVC, to: itemViewTwo)
        add(childVC: RMCharacterHeaderVC(character: character), to: headerView)
    }
    
    
    func getCharacterInfo() {
        showLoadingView()
        
        NetworkManager.shared.getCharacter(for: characterID) { [weak self] result in
            guard let self = self else { return }
            
            self.dismissLoadingView()
            
            switch result {
            case .success(let character):
                DispatchQueue.main.async { self.configureUIElements(with: character) }
                
            case .failure(let error):
                self.presentRMAlert(title: "Something went wrong", message: error.rawValue, buttonTitle: "Dismiss")
            }
        }
    }
    
    
    func layoutUI() {
        let padding: CGFloat    = 20
        let itemHeight: CGFloat = 140
        
        itemViews = [headerView ,itemViewOne, itemViewTwo]
        
        for itemView in itemViews {
            view.addSubview(itemView)
            itemView.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                itemView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
                itemView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            ])
        }
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: padding),
            headerView.heightAnchor.constraint(equalToConstant: 180),
            
            itemViewOne.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 10),
            itemViewOne.heightAnchor.constraint(equalToConstant: itemHeight),
            
            itemViewTwo.topAnchor.constraint(equalTo: itemViewOne.bottomAnchor, constant: padding),
            itemViewTwo.heightAnchor.constraint(equalToConstant: itemHeight),
        ])
    }
    
    
    func add(childVC: UIViewController, to containerView: UIView) {
        addChild(childVC)
        containerView.addSubview(childVC.view)
        childVC.view.frame = containerView.bounds
        childVC.didMove(toParent: self)
    }
    
    
    @objc func dismissVC() {
        dismiss(animated: true)
    }

}


extension CharacterDetailsVC: CharacterDetailsVCDelegate {
    
    func didTapLocation(for character: Character) {
        let destVC = LocationDetailsVC()
        destVC.locationName = character.location.name
        
        navigationController?.pushViewController(destVC, animated: true)
    }
    
    
    func didTapEpisodes(for character: Character) {
        let destVC = CharacterEpisodesVC()
        destVC.episodes = character.episode
        
        navigationController?.pushViewController(destVC, animated: true)
    }
    
}
