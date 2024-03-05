//
//  LocationResponse.swift
//  RickMortyCollection
//
//  Created by Germán Hernández del Rosario on 5/3/24.
//

import Foundation

struct LocationResponse: Codable {
    let info: InfoResponse
    let results: [LocationItemResponse]
}
