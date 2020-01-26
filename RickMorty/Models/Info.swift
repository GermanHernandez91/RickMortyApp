//
//  Info.swift
//  RickMorty
//
//  Created by German Hernandez on 26/01/2020.
//  Copyright © 2020 German Hernandez. All rights reserved.
//

import Foundation

struct Info: Codable {
    let count, pages: Int
    let next: String
    let prev: String
}
