//
//  MockLocationRepository.swift
//  RickMortyCollectionTests
//
//  Created by Germán Hernández del Rosario on 5/3/24.
//

import Foundation
@testable import RickMortyCollection

final class MockLocationRepository: LocationRepository {
    
    func getLocations() async throws -> [RickMortyCollection.Location] {
        MockLocation.locations
    }
}
