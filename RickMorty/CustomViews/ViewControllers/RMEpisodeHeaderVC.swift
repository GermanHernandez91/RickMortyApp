//
//  RMEpisodeHeaderVC.swift
//  RickMorty
//
//  Created by German Hernandez on 29/01/2020.
//  Copyright © 2020 German Hernandez. All rights reserved.
//

import UIKit

class RMEpisodeHeaderVC: UIViewController {

    let nameLabel       = RMTitleLabel(textAlignment: .left, fontSize: 24)
    let dateLabel       = RMSecondaryTitleLabel(fontSize: 16)
    let episodeLabel    = RMSecondaryTitleLabel(fontSize: 16)
    
    var episode: Episode!
    
    
    init(episode: Episode) {
        super.init(nibName: nil, bundle: nil)
        self.episode = episode
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
        nameLabel.text          = episode.name
        dateLabel.text          = "Date: \(episode.airDate)"
        episodeLabel.text       = "Episode: \(episode.episode)"
    }
    
    
    func addSubView() {
        view.addSubview(nameLabel)
        view.addSubview(dateLabel)
        view.addSubview(episodeLabel)
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
            
            dateLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: padding),
            dateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: textImagePadding),
            dateLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            dateLabel.heightAnchor.constraint(equalToConstant: padding),
            
            episodeLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: itemTopPadding),
            episodeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: textImagePadding),
            episodeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            episodeLabel.heightAnchor.constraint(equalToConstant: padding),
        ])
    }

}
