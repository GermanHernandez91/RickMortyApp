//
//  LocationRepositoryImpl.swift
//  RickMortyCollection
//
//  Created by Germán Hernández del Rosario on 5/3/24.
//

import Foundation

final class LocationRepositoryImpl: LocationRepository {
    
    private let api: RickMortyApi
    
    init(api: RickMortyApi = RickMortyApiImpl()) {
        self.api = api
    }
    
    func getLocations() async throws -> [Location] {
        try await api.getLocations().results.map { $0.toLocation() }
    }
}
