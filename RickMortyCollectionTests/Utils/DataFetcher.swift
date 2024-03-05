//
//  DataFetcher.swift
//  RickMortyCollectionTests
//
//  Created by Germán Hernández del Rosario on 5/3/24.
//

import Foundation

final class DataFetcher {
    static let shared = DataFetcher()
    
    private init() {}
    
    enum DataFetcherError: Error {
        case invalidFile
        case somethingWentWrong
    }
    
    func getJsonData<T: Codable>(from fileName: String) async throws -> T {
        let testBundle = Bundle(for: type(of: self))
        
        guard let url = testBundle.url(forResource: fileName, withExtension: "json") else {
            throw DataFetcherError.invalidFile
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let jsonData = try decoder.decode(T.self, from: data)
            return jsonData
        } catch {
            throw DataFetcherError.somethingWentWrong
        }
    }
}
