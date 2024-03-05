//
//  CharacterGetAllUseCaseTests.swift
//  RickMortyCollectionTests
//
//  Created by Germán Hernández del Rosario on 4/3/24.
//

import XCTest
@testable import RickMortyCollection

final class CharacterGetAllUseCaseTests: XCTestCase {
    
    private var sut: CharacterGetAllUseCase!
    
    override func setUp() async throws {
        try await super.setUp()
        
        sut = CharacterGetAllUseCase(repository: CharacterRepositoryImpl(api: MockApi()))
    }
    
    override func tearDown() async throws {
        sut = nil
        
        try await super.tearDown()
    }
    
    func test_execute_shouldReturnCharacters() async throws {
        let characters = try await sut.execute()
        XCTAssertEqual(characters.count, 20)
    }
}
