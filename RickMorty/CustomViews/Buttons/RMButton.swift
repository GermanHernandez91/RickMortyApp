//
//  RMButton.swift
//  RickMorty
//
//  Created by German Hernandez on 26/01/2020.
//  Copyright © 2020 German Hernandez. All rights reserved.
//

import UIKit

class RMButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    init(backgroundColor: UIColor, title: String) {
        super.init(frame: .zero)
        
        self.backgroundColor = backgroundColor
        self.setTitle(title, for: .normal)
        
        configure()
    }
    
    
    func set(backgroundColor: UIColor, title: String) {
        self.backgroundColor = backgroundColor
        self.setTitle(title, for: .normal)
    }
    
    
    private func configure() {
        layer.cornerRadius  = 10
        titleLabel?.font    = UIFont.preferredFont(forTextStyle: .headline)
        
        setTitleColor(.white, for: .normal)
        translatesAutoresizingMaskIntoConstraints = false
    }

}
