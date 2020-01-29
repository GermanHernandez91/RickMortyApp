//
//  LocationDetailsVC.swift
//  RickMorty
//
//  Created by German Hernandez on 27/01/2020.
//  Copyright © 2020 German Hernandez. All rights reserved.
//

import UIKit

protocol LocationDetailsVCDelegate: class {
    func didTapResidents(for location: Location)
}

class LocationDetailsVC: UIViewController {
    
    let headerView          = UIView()
    let itemViewOne         = UIView()
    var itemViews: [UIView] = []
      
    var locationID: Int!
    
    weak var delegate: CharacterDetailsVCDelegate!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        configueViewController()
        layoutUI()
        getLocation()
    }
    
    
    func configueViewController() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    
    func configureUIElements(with location: Location) {
        let locationInfoVC      = RMResidentsInfoVC(location: location)
        locationInfoVC.delegate = self
        
        add(childVC: locationInfoVC, to: itemViewOne)
        add(childVC: RMLocationHeaderVC(location: location), to: headerView)
        
        title = location.name
    }
    
    
    func getLocation() {
        showLoadingView()
        
        NetworkManager.shared.getLocation(for: locationID) { [weak self] result in
            guard let self = self else { return }
            
            self.dismissLoadingView()
            
            switch result {
            case .success(let location):
                DispatchQueue.main.async { self.configureUIElements(with: location) }
                
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


extension LocationDetailsVC: LocationDetailsVCDelegate {
    
    func didTapResidents(for location: Location) {
        let destVC = CharactersVC(screenType: .secondary, title: "Residents", charactersID: location.getResidentsID())
        navigationController?.pushViewController(destVC, animated: true)
    }
    
}
