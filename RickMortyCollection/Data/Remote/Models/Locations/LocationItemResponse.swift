//
//  LocationResponse.swift
//  RickMortyCollection
//
//  Created by Germán Hernández del Rosario on 4/3/24.
//

import Foundation

struct LocationItemResponse: Codable {
    let id: Int?
    let name: String
    let type: String?
    let dimension: String?
    let residents: [String]?
}
