//
//  Character.swift
//  RickMortyCollection
//
//  Created by Germán Hernández del Rosario on 4/3/24.
//

import Foundation

struct Character: Identifiable, Hashable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String?
    let gender: GenderType
    let origin: Location?
    let location: Location?
    let image: String
    let episode: [String]
    
    var imageURL: URL? {
        URL(string: image)
    }
}

extension Character {
    static let mock: [Self] = [
        .init(id: 1,
              name: "Rick Sanchez",
              status: "Alive",
              species: "Human",
              type: nil,
              gender: .Male,
              origin: Location(name: "Earth"),
              location: Location(name: "Earth"),
              image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
              episode: [
                    "https://rickandmortyapi.com/api/episode/1",
                    "https://rickandmortyapi.com/api/episode/2"]
             )
    ]
}
