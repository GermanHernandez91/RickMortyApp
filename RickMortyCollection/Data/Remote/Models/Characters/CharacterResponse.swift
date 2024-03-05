//
//  CharacterResponse.swift
//  RickMortyCollection
//
//  Created by Germán Hernández del Rosario on 4/3/24.
//

import Foundation

struct CharacterResponse: Codable {
    let info: InfoResponse
    let results: [CharacterItemResponse]
}
