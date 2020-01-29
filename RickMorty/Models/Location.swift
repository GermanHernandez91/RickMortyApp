//
//  Location.swift
//  RickMorty
//
//  Created by German Hernandez on 26/01/2020.
//  Copyright © 2020 German Hernandez. All rights reserved.
//

import Foundation

struct Locations: Codable {
    let info: Info
    let results: [Location]
}

struct Location: Codable {
    let id: Int
    let name, type, dimension: String
    let residents: [String]
    let url: String
    let created: String
    
    
    func getResidentsID() -> [Int] {
        var residentsID: Set<Int> = []
        
        for resident in self.residents {
            let id = resident.compactMap { $0.wholeNumberValue }
            residentsID.insert(id[0])
        }
        
        return Array(residentsID)
    }
}
