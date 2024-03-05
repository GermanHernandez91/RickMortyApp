//
//  RickMortyApi.swift
//  RickMortyCollection
//
//  Created by Germán Hernández del Rosario on 4/3/24.
//

import Foundation
import NetworkClient

protocol RickMortyApi {
    func getCharacters() async throws -> CharacterResponse
    func getCharacterById(id: Int) async throws -> CharacterItemResponse
    func searchCharacters(name: String) async throws -> CharacterResponse
    func getLocations() async throws -> LocationResponse
}

final class RickMortyApiImpl: RickMortyApi {
    
    func getCharacters() async throws -> CharacterResponse {
        try await NetworkClient.Request(url: Constants.Endpoints.characters, method: .get).run()
    }
    
    func getCharacterById(id: Int) async throws -> CharacterItemResponse {
        try await NetworkClient.Request(url: Constants.Endpoints.characters + "/\(id)", method: .get).run()
    }
    
    func getLocations() async throws -> LocationResponse {
        try await NetworkClient.Request(url: Constants.Endpoints.locations, method: .get).run()
    }
    
    func searchCharacters(name: String) async throws -> CharacterResponse {
        try await NetworkClient.Request(
            url: Constants.Endpoints.characters + "/?name=\(name)",
            method: .get
        ).run()
    }
}
