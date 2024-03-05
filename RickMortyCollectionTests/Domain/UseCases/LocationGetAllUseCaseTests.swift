//
//  LocationGetAllUseCaseTests.swift
//  RickMortyCollectionTests
//
//  Created by Germán Hernández del Rosario on 5/3/24.
//

import XCTest
@testable import RickMortyCollection

final class LocationGetAllUseCaseTests: XCTestCase {
    
    private var sut: LocationGetAllUseCase!
    
    override func setUp() async throws {
        try await super.setUp()
        
        sut = LocationGetAllUseCase(repository: LocationRepositoryImpl(api: MockApi()))
    }
    
    override func tearDown() async throws {
        sut = nil
        
        try await super.tearDown()
    }
    
    func test_Execute_ShouldReturnLocations() async throws {
        let locations = try await sut.execute()
        XCTAssertEqual(locations.count, 20)
    }
}
