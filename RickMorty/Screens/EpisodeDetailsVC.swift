//
//  EpisodeDetailsVC.swift
//  RickMorty
//
//  Created by German Hernandez on 29/01/2020.
//  Copyright © 2020 German Hernandez. All rights reserved.
//

import UIKit

protocol EpisodeDetailsVCDelegate: class {
    func didTapCharacters(for episode: Episode)
}

class EpisodeDetailsVC: UIViewController {
    
    let headerView          = UIView()
    let itemViewOne         = UIView()
    var itemViews: [UIView] = []
      
    var episodeID: Int!
    
    weak var delegate: CharacterDetailsVCDelegate!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        configueViewController()
        layoutUI()
        getEpisode()
    }
    
    
    func configueViewController() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    
    func configureUIElements(with episode: Episode) {
        let episodeInfoVC      = RMCharactersInfoVC(episode: episode)
        episodeInfoVC.delegate = self
        
        add(childVC: episodeInfoVC, to: itemViewOne)
        add(childVC: RMEpisodeHeaderVC(episode: episode), to: headerView)
        
        title = episode.episode
    }
    
    
    func getEpisode() {
        showLoadingView()
        
        NetworkManager.shared.getEpisode(for: episodeID) { [weak self] result in
            guard let self = self else { return }
            
            self.dismissLoadingView()
            
            switch result {
            case .success(let episode):
                DispatchQueue.main.async { self.configureUIElements(with: episode) }
                
            case .failure(let error):
                self.presentRMAlert(title: "Something went wrong", message: error.rawValue, buttonTitle: "Dismiss")
            }
        }
    }
    
    
    func layoutUI() {
        let padding: CGFloat    = 20
        let itemHeight: CGFloat = 140
        
        itemViews = [headerView, itemViewOne]
        
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
            
            itemViewOne.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            itemViewOne.heightAnchor.constraint(equalToConstant: itemHeight),
        ])
    }
    
    
    func add(childVC: UIViewController, to containerView: UIView) {
        addChild(childVC)
        containerView.addSubview(childVC.view)
        childVC.view.frame = containerView.bounds
        childVC.didMove(toParent: self)
    }

}

extension EpisodeDetailsVC: EpisodeDetailsVCDelegate {
    
    func didTapCharacters(for episode: Episode) {
        let destVC = CharactersVC(screenType: .secondary, title: "Characters", charactersID: episode.getCharactersID())
        navigationController?.pushViewController(destVC, animated: true)
    }
    
}
