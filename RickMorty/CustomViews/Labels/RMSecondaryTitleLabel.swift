//
//  RMSecondaryTitleLabel.swift
//  RickMorty
//
//  Created by German Hernandez on 26/01/2020.
//  Copyright © 2020 German Hernandez. All rights reserved.
//

import UIKit

class RMSecondaryTitleLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    init(fontSize: CGFloat) {
        super.init(frame: .zero)
        
        self.font = UIFont.systemFont(ofSize: fontSize, weight: .medium)
        
        configure()
    }
    
    
    private func configure() {
        textColor                   = .secondaryLabel
        adjustsFontSizeToFitWidth   = true
        minimumScaleFactor          = 0.90
        lineBreakMode               = .byTruncatingTail
        
        translatesAutoresizingMaskIntoConstraints = false
    }
}
