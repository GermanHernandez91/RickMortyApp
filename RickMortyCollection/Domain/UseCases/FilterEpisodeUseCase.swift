//
//  FilterEpisodeUseCase.swift
//  RickMortyCollection
//
//  Created by Germán Hernández del Rosario on 5/3/24.
//

import Foundation

final class FilterEpisodeUseCase {
    
    func execute(episodes: [String]) -> [String] {
        var formatted = [String]()
        
        episodes.forEach { episode in
            if let url = URL(string: episode) {
                if let lastPathComponent = url.lastPathComponent.components(separatedBy: ".").first,
                   let lastNumber = Int(lastPathComponent) {
                    formatted.append("Episode: #\(lastNumber)")
                }
            }
        }
        
        return formatted
    }
}
