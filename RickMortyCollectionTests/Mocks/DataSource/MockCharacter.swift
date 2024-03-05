//
//  MockCharacter.swift
//  RickMortyCollectionTests
//
//  Created by Germán Hernández del Rosario on 5/3/24.
//

import Foundation
@testable import RickMortyCollection

enum MockCharacter {
    
    static let characters: [Character] = [
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
    
    static let character = Character(
        id: 2,
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
}
