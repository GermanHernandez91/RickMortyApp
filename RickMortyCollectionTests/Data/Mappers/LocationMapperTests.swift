//
//  LocationMapperTests.swift
//  RickMortyCollectionTests
//
//  Created by Germán Hernández del Rosario on 4/3/24.
//

import XCTest
@testable import RickMortyCollection

final class LocationMapperTests: XCTestCase {
    
    func test_toLocation_shouldReturnLocation() {
        let sut = provideSut()
        XCTAssertEqual(sut.toLocation().name, "location")
    }
}

private extension LocationMapperTests {
    
    func provideSut() -> LocationItemResponse {
        LocationItemResponse(id: 1, name: "location", type: nil, dimension: nil, residents: [])
    }
}
