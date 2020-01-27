//
//  LocationDetailsVC.swift
//  RickMorty
//
//  Created by German Hernandez on 27/01/2020.
//  Copyright © 2020 German Hernandez. All rights reserved.
//

import UIKit

class LocationDetailsVC: UIViewController {
    
    var locationName: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        configueViewController()
    }
    
    
    func configueViewController() {
        title = locationName
        view.backgroundColor = .systemBackground
    }

}
