//
//  CharacterRepositoryImpl.swift
//  RickMortyCollection
//
//  Created by Germán Hernández del Rosario on 4/3/24.
//

import Foundation

final class CharacterRepositoryImpl: CharacterRepository {
    
    private let api: RickMortyApi
    
    init(api: RickMortyApi = RickMortyApiImpl()) {
        self.api = api
    }
    
    func getCharacters() async throws -> [Character] {
        try await api.getCharacters().results.map { $0.toCharacter() }
    }
    
    func getCharacterById(id: Int) async throws -> Character {
        try await api.getCharacterById(id: id).toCharacter()
    }
    
    func searchCharacters(name: String) async throws -> [Character] {
        try await api.searchCharacters(name: name).results.map { $0.toCharacter() }
    }
}
