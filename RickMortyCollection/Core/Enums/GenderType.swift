//
//  GenderType.swift
//  RickMortyCollection
//
//  Created by Germán Hernández del Rosario on 4/3/24.
//

import Foundation

enum GenderType: String, Codable, Hashable {
    case Female
    case Male
    case Genderless
    case unknown = "Unknown"
}
