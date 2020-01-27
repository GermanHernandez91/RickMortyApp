//
//  RMCharacterHeaderVC.swift
//  RickMorty
//
//  Created by German Hernandez on 27/01/2020.
//  Copyright © 2020 German Hernandez. All rights reserved.
//

import UIKit

class RMCharacterHeaderVC: UIViewController {
    
    let avatarImage     = RMImageView(frame: .zero)
    let nameLabel       = RMTitleLabel(textAlignment: .left, fontSize: 24)
    let statusLabel     = RMSecondaryTitleLabel(fontSize: 16)
    let speciesLabel    = RMSecondaryTitleLabel(fontSize: 16)
    let genderLabel     = RMSecondaryTitleLabel(fontSize: 16)
    
    var character: Character!
    
    
    init(character: Character) {
        super.init(nibName: nil, bundle: nil)
        self.character = character
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
        avatarImage.downloadImage(from: character.image)
        nameLabel.text      = character.name
        statusLabel.text    = "Status: \(character.status)"
        speciesLabel.text   = "Species: \(character.species)"
        genderLabel.text    = "Gender: \(character.gender)"
    }
    
    
    func addSubView() {
        view.addSubview(avatarImage)
        view.addSubview(nameLabel)
        view.addSubview(statusLabel)
        view.addSubview(speciesLabel)
        view.addSubview(genderLabel)
    }
    
    
    func layoutUI() {
        let padding: CGFloat            = 20
        let itemTopPadding: CGFloat     = 8
        let textImagePadding: CGFloat   = 12
        
        NSLayoutConstraint.activate([
            avatarImage.topAnchor.constraint(equalTo: view.topAnchor, constant: padding),
            avatarImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            avatarImage.widthAnchor.constraint(equalToConstant: 125),
            avatarImage.heightAnchor.constraint(equalToConstant: 125),
            
            nameLabel.topAnchor.constraint(equalTo: avatarImage.topAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: avatarImage.trailingAnchor, constant: textImagePadding),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            nameLabel.heightAnchor.constraint(equalToConstant: 26),
            
            statusLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: padding),
            statusLabel.leadingAnchor.constraint(equalTo: avatarImage.trailingAnchor, constant: textImagePadding),
            statusLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            statusLabel.heightAnchor.constraint(equalToConstant: 20),
            
            speciesLabel.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: itemTopPadding),
            speciesLabel.leadingAnchor.constraint(equalTo: avatarImage.trailingAnchor, constant: textImagePadding),
            speciesLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            speciesLabel.heightAnchor.constraint(equalToConstant: 20),
            
            genderLabel.topAnchor.constraint(equalTo: speciesLabel.bottomAnchor, constant: itemTopPadding),
            genderLabel.leadingAnchor.constraint(equalTo: avatarImage.trailingAnchor, constant: textImagePadding),
            genderLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            genderLabel.heightAnchor.constraint(equalToConstant: 20),
        ])
    }

}
