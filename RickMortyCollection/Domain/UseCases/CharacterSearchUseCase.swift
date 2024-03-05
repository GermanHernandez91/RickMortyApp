//
//  CharacterSearchUseCase.swift
//  RickMortyCollection
//
//  Created by Germán Hernández del Rosario on 5/3/24.
//

import Foundation

final class CharacterSearchUseCase {
    
    private let repository: CharacterRepository
    
    init(repository: CharacterRepository = CharacterRepositoryImpl()) {
        self.repository = repository
    }
    
    func execute(name: String) async throws -> [Character] {
        try await repository.searchCharacters(name: name)
    }
}
