//
//  NetworkManager.swift
//  RickMorty
//
//  Created by German Hernandez on 26/01/2020.
//  Copyright © 2020 German Hernandez. All rights reserved.
//

import UIKit

class NetworkManager {
    static let shared   = NetworkManager()
    private let baseURL = "https://rickandmortyapi.com/api/"
    let cache           = NSCache<NSString, UIImage>()
    
    private init() {}
    
    
    // MARK: - Characters
    
    func getCharacters(page: Int, charactersID: [Int], completion: @escaping (Result<Characters, RMError>) -> Void) {
        var endpoint = baseURL + "character/?page=\(page)"
        
        if !charactersID.isEmpty {
            var characterArray: [String] = []
            
            for character in charactersID {
                characterArray.append(String(character))
            }
            
            endpoint = baseURL + "character/\(characterArray.joined(separator: ","))"
        }
        
        guard let url = URL(string: endpoint) else {
            completion(.failure(.invalidURL))
            return
        }
        
        performTask(with: url) { result in
            switch result {
            case .success(let data):
                do {
                    let decoder = JSONDecoder()
      
                    if !charactersID.isEmpty {
                        let response = try decoder.decode([Character].self, from: data)
                        
                        let info = Info.init(count: response.count, pages: 1, next: "", prev: "")
                        let characters = Characters.init(info: info, results: response)
                        
                        completion(.success(characters))
                    } else {
                        let response = try decoder.decode(Characters.self, from: data)
                        completion(.success(response))
                    }
                } catch {
                    completion(.failure(.invalidData))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    
    func getCharacter(for characterID: Int, completion: @escaping (Result<Character, RMError>) -> Void) {
        let endpoint = baseURL + "character/\(characterID)"
        
        guard let url = URL(string: endpoint) else {
            completion(.failure(.invalidURL))
            return
        }
        
        performTask(with: url) { result in
            switch result {
            case .success(let data):
                do {
                    let decoder = JSONDecoder()
                    let character = try decoder.decode(Character.self, from: data)
                    
                    completion(.success(character))
                } catch {
                    completion(.failure(.invalidData))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    
    // MARK: - Locations
    
    func getLocations(page: Int, locationsID: [Int]?,  completion: @escaping (Result<Locations, RMError>) -> Void) {
        var endpoint = baseURL + "location/?page=\(page)"
        
        if let locationsID = locationsID {
            endpoint += "/\(locationsID)"
        }
        
        guard let url = URL(string: endpoint) else {
            completion(.failure(.invalidURL))
            return
        }
        
        performTask(with: url) { result in
            switch result {
            case .success(let data):
                do {
                    let decoder = JSONDecoder()
                    let response = try decoder.decode(Locations.self, from: data)
                    
                    completion(.success(response))
                } catch {
                    completion(.failure(.invalidData))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    
    func getLocation(for locationID: Int, completion: @escaping (Result<Location, RMError>) -> Void) {
        let endpoint = baseURL + "location/\(locationID)"
        
        guard let url = URL(string: endpoint) else {
            completion(.failure(.invalidURL))
            return
        }
        
        performTask(with: url) { result in
            switch result {
            case .success(let data):
                do {
                    let decoder = JSONDecoder()
                    let location = try decoder.decode(Location.self, from: data)
                    
                    completion(.success(location))
                } catch {
                    completion(.failure(.invalidData))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    
    func getLocationByURL(endpoint: String, completion: @escaping (Result<Location, RMError>) -> Void) {
        guard let url = URL(string: endpoint) else {
            completion(.failure(.invalidURL))
            return
        }
        
        performTask(with: url) { result in
            switch result {
            case .success(let data):
                do {
                    let decoder = JSONDecoder()
                    let location = try decoder.decode(Location.self, from: data)
                    
                    completion(.success(location))
                } catch {
                    completion(.failure(.invalidData))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    
    // MARK: - Episodes
    
    func getEpisodes(page: Int, episodesID: [Int], completion: @escaping (Result<Episodes, RMError>) -> Void) {
        var endpoint = baseURL + "episode?page=\(page)/"
           
        if !episodesID.isEmpty {
            var episodesArray: [String] = []
            
            for episode in episodesID {
                episodesArray.append(String(episode))
            }
            
            endpoint = baseURL + "episode/\(episodesArray.joined(separator: ","))"
        }

        guard let url = URL(string: endpoint) else {
           completion(.failure(.invalidURL))
           return
        }

        performTask(with: url) { result in
           switch result {
           case .success(let data):
               do {
                    let decoder = JSONDecoder()
                    
                    if !episodesID.isEmpty {
                        let response = try decoder.decode([Episode].self, from: data)

                        let info = Info.init(count: response.count, pages: 1, next: "", prev: "")
                        let episodes = Episodes.init(info: info, results: response)

                        completion(.success(episodes))
                    } else {
                        let response = try decoder.decode(Episodes.self, from: data)
                        completion(.success(response))
                    }
               } catch {
                    print(error)
                   completion(.failure(.invalidData))
               }
           case .failure(let error):
               completion(.failure(error))
           }
        }
    }
    
    
    func getEpisode(for episodeID: Int, completion: @escaping (Result<Episode, RMError>) -> Void) {
        let endpoint = baseURL + "episode/\(episodeID)"
        
        guard let url = URL(string: endpoint) else {
            completion(.failure(.invalidURL))
            return
        }
        
        performTask(with: url) { result in
            switch result {
            case .success(let data):
                do {
                    let decoder = JSONDecoder()
                    let episode = try decoder.decode(Episode.self, from: data)
                    
                    completion(.success(episode))
                } catch {
                    completion(.failure(.invalidData))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
}
