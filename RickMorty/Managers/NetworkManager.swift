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
    
    func getCharacters(page: Int, charactersID: [Int]?, completion: @escaping (Result<Characters, RMError>) -> Void) {
        var endpoint = baseURL + "character/?page=\(page)"
        
        if let charactersID = charactersID {
            endpoint += "/\(charactersID)"
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
                    let response = try decoder.decode(Characters.self, from: data)
                    
                    completion(.success(response))
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
        let endpoint = baseURL + "character/\(locationID)"
        
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
    
    func getEpisodes(page: Int, episodesID: [Int]?, completion: @escaping (Result<[Episode], RMError>) -> Void) {
        var endpoint = baseURL + "episode?page=\(page)/"
           
        if let episodesID = episodesID {
           endpoint += "\(episodesID)"
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
                   let response = try decoder.decode(Episodes.self, from: data)
                   
                   completion(.success(response.results))
               } catch {
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
