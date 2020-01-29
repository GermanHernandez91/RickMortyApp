//
//  Character.swift
//  RickMorty
//
//  Created by German Hernandez on 26/01/2020.
//  Copyright © 2020 German Hernandez. All rights reserved.
//

import Foundation

struct Characters: Codable {
    let info: Info
    let results: [Character]
}

struct Character: Codable {
    let id: Int
    let name, status, species, type: String
    let gender: String
    let origin, location: CharacterLocation
    let image: String
    let episode: [String]
    let url: String
    let created: String
    
    func getEpisodesID() -> [Int] {
        var episodesID: Set<Int> = []
        
        for episode in self.episode {
            let id = episode.compactMap { $0.wholeNumberValue }
            episodesID.insert(id[0])
        }
        
        return Array(episodesID)
    }
}

struct CharacterLocation: Codable {
    let name: String
    let url: String
}
