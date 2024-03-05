//
//  CharacterGetAllUseCase.swift
//  RickMortyCollection
//
//  Created by Germán Hernández del Rosario on 4/3/24.
//

import Foundation

final class CharacterGetAllUseCase {
    
    private let repository: CharacterRepository
    
    init(repository: CharacterRepository = CharacterRepositoryImpl()) {
        self.repository = repository
    }
    
    func execute() async throws -> [Character] {
        try await repository.getCharacters()
    }
}
