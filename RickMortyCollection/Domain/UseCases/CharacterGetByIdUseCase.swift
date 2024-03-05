//
//  CharacterGetByIdUseCase.swift
//  RickMortyCollection
//
//  Created by Germán Hernández del Rosario on 5/3/24.
//

import Foundation

final class CharacterGetByIdUseCase {
    
    private let repository: CharacterRepository
    
    init(repository: CharacterRepository = CharacterRepositoryImpl()) {
        self.repository = repository
    }
    
    func execute(id: Int) async throws -> Character {
        try await repository.getCharacterById(id: id)
    }
}
