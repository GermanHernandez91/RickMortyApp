//
//  InfoResponse.swift
//  RickMortyCollection
//
//  Created by Germán Hernández del Rosario on 4/3/24.
//

import Foundation

struct InfoResponse: Codable {
    let count: Int
    let pages: Int
    let next: String?
    let prev: String?
}
