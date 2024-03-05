//
//  LocationRepository.swift
//  RickMortyCollection
//
//  Created by Germán Hernández del Rosario on 5/3/24.
//

import Foundation

protocol LocationRepository {
    func getLocations() async throws -> [Location]
}
