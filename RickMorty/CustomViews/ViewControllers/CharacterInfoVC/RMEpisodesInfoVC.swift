//
//  RMEpisodesInfoVC.swift
//  RickMorty
//
//  Created by German Hernandez on 27/01/2020.
//  Copyright © 2020 German Hernandez. All rights reserved.
//

import UIKit

class RMEpisodesInfoVC: RMCharacterInfoVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        configueItems()
    }
    

    private func configueItems() {
        actionButton.set(backgroundColor: .systemPink, title: "View Episodes")
    }
    
    
    override func actionButtonTapped() {
        delegate.didTapEpisodes(for: character)
    }

}
