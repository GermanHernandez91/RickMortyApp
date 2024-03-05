//
//  CharacterRepository.swift
//  RickMortyCollection
//
//  Created by Germán Hernández del Rosario on 4/3/24.
//

import Foundation

protocol CharacterRepository {
    func getCharacters() async throws -> [Character]
    func getCharacterById(id: Int) async throws -> Character
    func searchCharacters(name: String) async throws -> [Character]
}
