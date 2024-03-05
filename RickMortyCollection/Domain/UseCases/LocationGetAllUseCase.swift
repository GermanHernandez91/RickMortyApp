//
//  LocationGetAllUseCase.swift
//  RickMortyCollection
//
//  Created by Germán Hernández del Rosario on 5/3/24.
//

import Foundation

final class LocationGetAllUseCase {
    
    private let repository: LocationRepository
    
    init(repository: LocationRepository = LocationRepositoryImpl()) {
        self.repository = repository
    }
    
    func execute() async throws -> [Location] {
        try await repository.getLocations()
    }
}
