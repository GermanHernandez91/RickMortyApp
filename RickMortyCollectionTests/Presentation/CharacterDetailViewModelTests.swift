//
//  CharacterDetailViewModelTests.swift
//  RickMortyCollectionTests
//
//  Created by Germán Hernández del Rosario on 5/3/24.
//

import XCTest
@testable import RickMortyCollection

final class CharacterDetailViewModelTests: XCTestCase {
    
    private var sut: CharacterDetailViewModel!
    private var filterEpisodeUseCase: FilterEpisodeUseCase!
    
    override func setUp() async throws {
        try await super.setUp()
        
        filterEpisodeUseCase = FilterEpisodeUseCase()
        sut = CharacterDetailViewModel(
            characterGetByIdUseCase: CharacterGetByIdUseCase(repository: CharacterRepositoryImpl(api: MockApi())),
            filterEpisodeUseCase: filterEpisodeUseCase
        )
    }
    
    override func tearDown() async throws {
        sut = nil
        filterEpisodeUseCase = nil
        
        try await super.tearDown()
    }
    
    func testLoadCharacterShouldReturnCharacter() async throws {
        await sut.loadCharacter(id: 1)
        
        XCTAssertNotNil(sut.character)
        XCTAssertFalse(sut.isLoading)
        XCTAssertFalse(sut.hasError)
        XCTAssertTrue(sut.error.isEmpty)
        XCTAssertEqual(sut.character?.id, 1)
        XCTAssertEqual(sut.episodes.first, "Episode: #1")
    }
}
