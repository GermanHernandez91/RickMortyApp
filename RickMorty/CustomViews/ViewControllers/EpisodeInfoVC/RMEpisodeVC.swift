//
//  RMEpisodeVC.swift
//  RickMorty
//
//  Created by German Hernandez on 29/01/2020.
//  Copyright © 2020 German Hernandez. All rights reserved.
//

import UIKit

class RMEpisodeVC: UIViewController {

    let actionButton = RMButton()
    
    var episode: Episode!
    weak var delegate: EpisodeDetailsVCDelegate!

    
    init(episode: Episode) {
        super.init(nibName: nil, bundle: nil)
        self.episode = episode
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureBackgroundView()
        configureActionButton()
        layoutUI()
    }

    
    func configureBackgroundView() {
        view.layer.cornerRadius = 18
        view.backgroundColor    = .secondarySystemBackground
    }
    
    
    private func configureActionButton() {
        actionButton.addTarget(self, action: #selector(actionButtonTapped), for: .touchUpInside)
    }
    
    
    @objc func actionButtonTapped() {}
    
    
    private func layoutUI() {
        view.addSubview(actionButton)
        
        let padding: CGFloat    = 20
        let height: CGFloat     = 50
        
        NSLayoutConstraint.activate([
            actionButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            actionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            actionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            actionButton.heightAnchor.constraint(equalToConstant: height),
        ])
    }

}
