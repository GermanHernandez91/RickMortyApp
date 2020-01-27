//
//  RMLocationHeaderVC.swift
//  RickMorty
//
//  Created by German Hernandez on 27/01/2020.
//  Copyright © 2020 German Hernandez. All rights reserved.
//

import UIKit

class RMLocationHeaderVC: UIViewController {

    let nameLabel       = RMTitleLabel(textAlignment: .left, fontSize: 24)
    let typeLabel       = RMSecondaryTitleLabel(fontSize: 16)
    let dimensionLabel  = RMSecondaryTitleLabel(fontSize: 16)
    
    var location: Location!
    
    
    init(location: Location) {
        super.init(nibName: nil, bundle: nil)
        self.location = location
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubView()
        configureUIElements()
        layoutUI()
    }
    
    
    func configureUIElements() {
        nameLabel.text          = location.name
        typeLabel.text          = "Type: \(location.type)"
        dimensionLabel.text     = "Dimension: \(location.dimension)"
    }
    
    
    func addSubView() {
        view.addSubview(nameLabel)
        view.addSubview(typeLabel)
        view.addSubview(dimensionLabel)
    }
    
    
    func layoutUI() {
        let padding: CGFloat            = 20
        let itemTopPadding: CGFloat     = 8
        let textImagePadding: CGFloat   = 12
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: padding),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: textImagePadding),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            nameLabel.heightAnchor.constraint(equalToConstant: 30),
            
            typeLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: padding),
            typeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: textImagePadding),
            typeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            typeLabel.heightAnchor.constraint(equalToConstant: padding),
            
            dimensionLabel.topAnchor.constraint(equalTo: typeLabel.bottomAnchor, constant: itemTopPadding),
            dimensionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: textImagePadding),
            dimensionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            dimensionLabel.heightAnchor.constraint(equalToConstant: padding),
        ])
    }


}
