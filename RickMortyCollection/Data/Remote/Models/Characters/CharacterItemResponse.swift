//
//  CharacterItemResponse.swift
//  RickMortyCollection
//
//  Created by Germán Hernández del Rosario on 4/3/24.
//

import Foundation

struct CharacterItemResponse: Codable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String?
    let gender: String
    let origin: LocationItemResponse?
    let location: LocationItemResponse?
    let image: String
    let episode: [String]
}
