//
//  CharacterDetailsVC.swift
//  RickMorty
//
//  Created by German Hernandez on 26/01/2020.
//  Copyright © 2020 German Hernandez. All rights reserved.
//

import UIKit

class CharacterDetailsVC: UIViewController {
    
    var characterName: String!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
    }
    

    func configureViewController() {
        title                   = characterName
        view.backgroundColor    = .systemBackground
        
        let rightButton = UIBarButtonItem(image: UIImage(systemName: SFSymbols.favorite), style: .plain, target: self, action: #selector(onRightButtonPressed))
        navigationItem.rightBarButtonItem = rightButton
        
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    
    // MARK: - Methods
    
    @objc func onRightButtonPressed() {}

}
