//
//  RMCharactersInfoVC.swift
//  RickMorty
//
//  Created by German Hernandez on 29/01/2020.
//  Copyright © 2020 German Hernandez. All rights reserved.
//

import UIKit

class RMCharactersInfoVC: RMEpisodeVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    

    private func configureItems() {
        actionButton.set(backgroundColor: .systemIndigo, title: "View Characters")
    }
    
    
    override func actionButtonTapped() {
        delegate.didTapCharacters(for: episode)
    }

}
