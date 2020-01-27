//
//  CharacterEpisodesVC.swift
//  RickMorty
//
//  Created by German Hernandez on 27/01/2020.
//  Copyright © 2020 German Hernandez. All rights reserved.
//

import UIKit

class CharacterEpisodesVC: UIViewController {
    
    var episodes: [String]!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
    }
    

    func configureViewController() {
        title = "Character Episodes"
        view.backgroundColor = .systemBackground
    }

}
