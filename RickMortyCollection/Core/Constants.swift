//
//  Constants.swift
//  RickMortyCollection
//
//  Created by Germán Hernández del Rosario on 4/3/24.
//

import Foundation

enum Constants {
    static let baseURL = "https://rickandmortyapi.com/api/"
    
    enum Endpoints {
        static let characters = Constants.baseURL + "character"
        static let locations = Constants.baseURL + "location"
    }
}
