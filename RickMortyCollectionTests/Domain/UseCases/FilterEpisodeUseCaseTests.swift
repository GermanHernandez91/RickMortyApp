//
//  FilterEpisodeUseCaseTests.swift
//  RickMortyCollectionTests
//
//  Created by Germán Hernández del Rosario on 5/3/24.
//

import XCTest
@testable import RickMortyCollection

final class FilterEpisodeUseCaseTests: XCTestCase {
    
    private var sut: FilterEpisodeUseCase!
    
    override func setUp() async throws {
        try await super.setUp()
        
        sut = FilterEpisodeUseCase()
    }
    
    override func tearDown() async throws {
        sut = nil
        
        try await super.tearDown()
    }
    
    func test_Execute_ShouldReturnFormattedArray() async {
        let episodes = MockCharacter.character.episode
        let formattedEpisodes = sut.execute(episodes: episodes)
        
        XCTAssertEqual(formattedEpisodes.first, "Episode: #1")
    }
}
