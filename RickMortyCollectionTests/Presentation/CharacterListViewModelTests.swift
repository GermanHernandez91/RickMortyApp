//
//  CharacterListViewModelTests.swift
//  RickMortyCollectionTests
//
//  Created by Germán Hernández del Rosario on 4/3/24.
//

import XCTest
@testable import RickMortyCollection

final class CharacterListViewModelTests: XCTestCase {
    
    private var sut: CharacterListViewModel!
    
    override func setUp() async throws {
        try await super.setUp()
        
        sut = CharacterListViewModel(
            characterGetAllUseCase: CharacterGetAllUseCase(repository: CharacterRepositoryImpl(api: MockApi())),
            locationGetAllUseCase: LocationGetAllUseCase(repository: LocationRepositoryImpl(api: MockApi()))
        )
    }
    
    override func tearDown() async throws {
        sut = nil
        
        try await super.tearDown()
    }
    
    func test_loadCharacters_shouldReturnCharacters() async throws {
        await sut.loadCharacters()
        
        XCTAssertEqual(sut.characters.count, 20)
        XCTAssertFalse(sut.isLoading)
        XCTAssertFalse(sut.hasError)
        XCTAssertTrue(sut.error.isEmpty)
    }
    
    func test_loadLocations_ShouldReturnLocations() async throws {
        await sut.loadCharacters()
        
        XCTAssertEqual(sut.locations.count, 20)
        XCTAssertFalse(sut.isLoading)
        XCTAssertFalse(sut.hasError)
        XCTAssertTrue(sut.error.isEmpty)
    }
}
