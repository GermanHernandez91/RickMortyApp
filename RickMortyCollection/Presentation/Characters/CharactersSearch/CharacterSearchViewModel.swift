//
//  CharacterSearchViewModel.swift
//  RickMortyCollection
//
//  Created by Germán Hernández del Rosario on 5/3/24.
//

import Foundation

@Observable
final class CharacterSearchViewModel {
    
    private(set) var characters = [Character]()
    private(set) var isLoading = false
    private(set) var error = ""
    var searchQuery = ""
    var hasError = false
    
    @ObservationIgnored
    private let characterSearchUseCase: CharacterSearchUseCase
    
    init(characterSearchUseCase: CharacterSearchUseCase = CharacterSearchUseCase()) {
        self.characterSearchUseCase = characterSearchUseCase
    }
    
    func loadCharacters() async {
        isLoading = true
        
        do {
            characters = try await characterSearchUseCase.execute(name: searchQuery)
            isLoading = false
        } catch {
            isLoading = false
            hasError = true
            self.error = error.localizedDescription
        }
    }
}
