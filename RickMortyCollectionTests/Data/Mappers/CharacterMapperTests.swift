//
//  CharacterMapperTests.swift
//  RickMortyCollectionTests
//
//  Created by Germán Hernández del Rosario on 4/3/24.
//

import XCTest
@testable import RickMortyCollection

final class CharacterMapperTests: XCTestCase {

    func test_toCharacter_shouldReturnCharacter() {
        let sut = provideSut()
        XCTAssertEqual(sut.toCharacter().gender.rawValue, GenderType.Male.rawValue)
    }
}

private extension CharacterMapperTests {
    
    func provideSut() -> CharacterItemResponse {
        .init(id: 1, 
              name: "Rick",
              status: "Alive",
              species: "Human",
              type: nil,
              gender: "Male",
              origin: nil,
              location: nil,
              image: "",
              episode: []
        )
    }
}
