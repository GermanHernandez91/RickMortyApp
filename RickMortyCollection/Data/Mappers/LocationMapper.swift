//
//  LocationMapper.swift
//  RickMortyCollection
//
//  Created by Germán Hernández del Rosario on 4/3/24.
//

import Foundation

extension LocationItemResponse {
    
    func toLocation() -> Location {
        Location(id: id, name: name, type: type, dimension: dimension, residents: residents)
    }
}
