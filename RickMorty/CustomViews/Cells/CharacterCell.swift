//
//  CharacterCell.swift
//  RickMorty
//
//  Created by German Hernandez on 26/01/2020.
//  Copyright © 2020 German Hernandez. All rights reserved.
//

import UIKit

class CharacterCell: UITableViewCell {

    static let reuseID  = "CharacterCell"
    let avatarImage     = RMImageView(frame: .zero)
    let nameLabel       = RMTitleLabel(textAlignment: .left, fontSize: 26)
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func set(character: Character) {
        self.nameLabel.text = character.name
        self.avatarImage.downloadImage(from: character.image)
    }
    
    
    private func configure() {
        addSubview(nameLabel)
        addSubview(avatarImage)
        
        accessoryType           = .disclosureIndicator
        let padding: CGFloat    = 12
        
        NSLayoutConstraint.activate([
            avatarImage.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            avatarImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            avatarImage.heightAnchor.constraint(equalToConstant: 60),
            avatarImage.widthAnchor.constraint(equalToConstant: 60),
            
            nameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: avatarImage.trailingAnchor, constant: 24),
            nameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            nameLabel.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
    
}
