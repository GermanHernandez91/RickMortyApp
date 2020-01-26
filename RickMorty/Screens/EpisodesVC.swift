//
//  EpisodesVC.swift
//  RickMorty
//
//  Created by German Hernandez on 26/01/2020.
//  Copyright © 2020 German Hernandez. All rights reserved.
//

import UIKit

class EpisodesVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        configureViewController()
    }
    

    func configureViewController() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
    }

}
