//
//  FavoritesVC.swift
//  RickMorty
//
//  Created by German Hernandez on 27/01/2020.
//  Copyright © 2020 German Hernandez. All rights reserved.
//

import UIKit

class FavoritesVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        configureViewController()
    }
    

    func configureViewController() {
        title = "Favorites"
        view.backgroundColor = .systemBackground
    }
    
    
    @objc func dismissView() {
        dismiss(animated: true)
    }

}
