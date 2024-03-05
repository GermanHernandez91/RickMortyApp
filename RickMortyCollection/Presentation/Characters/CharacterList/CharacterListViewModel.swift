//
//  CharacterListViewModel.swift
//  RickMortyCollection
//
//  Created by Germán Hernández del Rosario on 4/3/24.
//

import Foundation

@Observable
final class CharacterListViewModel {
    
    private(set) var characters = [Character]()
    private(set) var locations = [Location]()
    private(set) var isLoading = false
    private(set) var error = ""
    
    var hasError = false
    
    @ObservationIgnored
    private let characterGetAllUseCase: CharacterGetAllUseCase
    
    @ObservationIgnored
    private let locationGetAllUseCase: LocationGetAllUseCase
    
    init(
        characterGetAllUseCase: CharacterGetAllUseCase = CharacterGetAllUseCase(),
        locationGetAllUseCase: LocationGetAllUseCase = LocationGetAllUseCase()
    ) {
        self.characterGetAllUseCase = characterGetAllUseCase
        self.locationGetAllUseCase = locationGetAllUseCase
    }
    
    func loadCharacters() async {
        isLoading = true
        
        do {
            characters = try await characterGetAllUseCase.execute()
            await loadLocations()
        } catch {
            isLoading = false
            hasError = true
            self.error = error.localizedDescription
        }
    }
    
    private func loadLocations() async {
        do {
            locations = try await locationGetAllUseCase.execute()
            isLoading = false
        } catch {
            isLoading = false
            hasError = true
            self.error = error.localizedDescription
        }
    }
}
