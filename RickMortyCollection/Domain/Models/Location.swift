//
//  Location.swift
//  RickMortyCollection
//
//  Created by Germán Hernández del Rosario on 4/3/24.
//

import Foundation

struct Location: Identifiable, Hashable {
    let id: Int?
    let name: String
    let type: String?
    let dimension: String?
    let residents: [String]?
    
    init(id: Int? = nil, name: String, type: String? = nil, dimension: String? = nil, residents: [String]? = []) {
        self.id = id
        self.name = name
        self.type = type
        self.dimension = dimension
        self.residents = residents
    }
}

extension Location {
    
    static let mock: [Self] = [
        .init(
            id: 1,
            name: "Earth",
            type: "Planet",
            dimension: "Dimension C-137",
            residents: [
                "https://rickandmortyapi.com/api/character/1",
                "https://rickandmortyapi.com/api/character/2"
            ]
        )
    ]
}
