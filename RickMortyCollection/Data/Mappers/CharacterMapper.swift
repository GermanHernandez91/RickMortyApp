//
//  CharacterMapper.swift
//  RickMortyCollection
//
//  Created by Germán Hernández del Rosario on 4/3/24.
//

import Foundation

extension CharacterItemResponse {
    
    func toCharacter() -> Character {
        Character(
            id: id,
            name: name,
            status: status,
            species: species,
            type: type,
            gender: GenderType(rawValue: gender) ?? .unknown,
            origin: origin?.toLocation(),
            location: location?.toLocation(),
            image: image,
            episode: episode
        )
    }
}
