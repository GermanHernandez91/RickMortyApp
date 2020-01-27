//
//  RMResidentsInfoVC.swift
//  RickMorty
//
//  Created by German Hernandez on 27/01/2020.
//  Copyright © 2020 German Hernandez. All rights reserved.
//

import UIKit

class RMResidentsInfoVC: RMLocationVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    

    private func configureItems() {
        actionButton.set(backgroundColor: .systemIndigo, title: "View Residents")
    }
    
    
    override func actionButtonTapped() {
        delegate.didTapResidents(for: location)
    }

}
