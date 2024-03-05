//
//  CharacterDetailViewModel.swift
//  RickMortyCollection
//
//  Created by Germán Hernández del Rosario on 5/3/24.
//

import Foundation

@Observable
final class CharacterDetailViewModel {
    
    private(set) var character: Character?
    private(set) var episodes = [String]()
    private(set) var isLoading = false
    private(set) var error = ""
    
    var hasError = false
    
    @ObservationIgnored
    private let characterGetByIdUseCase: CharacterGetByIdUseCase
    
    @ObservationIgnored
    private let filterEpisodeUseCase: FilterEpisodeUseCase
    
    init(
        characterGetByIdUseCase: CharacterGetByIdUseCase = CharacterGetByIdUseCase(),
        filterEpisodeUseCase: FilterEpisodeUseCase = FilterEpisodeUseCase()
    ) {
        self.characterGetByIdUseCase = characterGetByIdUseCase
        self.filterEpisodeUseCase = filterEpisodeUseCase
    }
    
    func loadCharacter(id: Int) async {
        isLoading = true
        
        do {
            character = try await characterGetByIdUseCase.execute(id: id)
            episodes = filterEpisodeUseCase.execute(episodes: character?.episode ?? [])
            
            isLoading = false
        } catch {
            isLoading = false
            hasError = true
            self.error = error.localizedDescription
        }
    }
}
