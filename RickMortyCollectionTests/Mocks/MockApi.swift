//
//  MockApi.swift
//  RickMortyCollectionTests
//
//  Created by Germán Hernández del Rosario on 5/3/24.
//

import Foundation
@testable import RickMortyCollection

final class MockApi: RickMortyApi {
    
    func getCharacters() async throws -> CharacterResponse {
        try await DataFetcher.shared.getJsonData(from: "characters")
    }
    
    func getCharacterById(id: Int) async throws -> CharacterItemResponse {
        try await DataFetcher.shared.getJsonData(from: "character_detail")
    }
    
    func getLocations() async throws -> LocationResponse {
        try await DataFetcher.shared.getJsonData(from: "locations")
    }
}
