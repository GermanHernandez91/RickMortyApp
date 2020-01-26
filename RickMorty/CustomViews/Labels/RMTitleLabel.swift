//
//  RMTitleLabel.swift
//  RickMorty
//
//  Created by German Hernandez on 26/01/2020.
//  Copyright © 2020 German Hernandez. All rights reserved.
//

import UIKit

class RMTitleLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    init(textAlignment: NSTextAlignment, fontSize: CGFloat) {
        super.init(frame: .zero)
        
        self.textAlignment  = textAlignment
        self.font           = UIFont.systemFont(ofSize: fontSize, weight: .bold)
        
        configure()
    }
    
    
    private func configure() {
        textColor                   = .label
        adjustsFontSizeToFitWidth   = false
        minimumScaleFactor          = 0.90
        lineBreakMode               = .byTruncatingTail
        
        translatesAutoresizingMaskIntoConstraints = false
    }

}
