//
//  MockLocation.swift
//  RickMortyCollectionTests
//
//  Created by Germán Hernández del Rosario on 5/3/24.
//

import Foundation
@testable import RickMortyCollection

enum MockLocation {
    
    static let locations: [Location] = [
        .init(id: 1, name: "Location", type: "Planet")
    ]
    
    static let location = Location(id: 1, name: "Location", type: "Planet")
}
