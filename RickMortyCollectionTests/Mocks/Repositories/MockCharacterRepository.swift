//
//  MockCharacterRepository.swift
//  RickMortyCollectionTests
//
//  Created by Germán Hernández del Rosario on 4/3/24.
//

import Foundation
@testable import RickMortyCollection

final class MockCharacterRepository: CharacterRepository {
    
    func getCharacters() async throws -> [Character] {
        MockCharacter.characters
    }
    
    func getCharacterById(id: Int) async throws -> Character {
        MockCharacter.character
    }
}
