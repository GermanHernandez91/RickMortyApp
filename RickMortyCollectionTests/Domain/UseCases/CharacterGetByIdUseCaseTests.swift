//
//  CharacterGetByIdUseCaseTests.swift
//  RickMortyCollectionTests
//
//  Created by Germán Hernández del Rosario on 5/3/24.
//

import XCTest
@testable import RickMortyCollection

final class CharacterGetByIdUseCaseTests: XCTestCase {
    
    private var sut: CharacterGetByIdUseCase!
    
    override func setUp() async throws {
        try await super.setUp()
        
        sut = CharacterGetByIdUseCase(repository: CharacterRepositoryImpl(api: MockApi()))
    }
    
    override func tearDown() async throws {
        sut = nil
        
        try await super.tearDown()
    }
    
    func test_Execute_ShouldReturnCharacterById() async throws {
        let character = try await sut.execute(id: 1)
        XCTAssertEqual(character.id, 1)
    }
}
