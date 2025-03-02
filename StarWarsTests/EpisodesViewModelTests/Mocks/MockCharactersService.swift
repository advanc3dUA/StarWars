//
//  MockCharactersService.swift
//  StarWarsTests
//
//  Created by Yuriy Gudimov on 02.03.25.
//

import Foundation
@testable import StarWars

class MockCharactersService {
    var characters: [Character] = []
}

extension MockCharactersService: CharactersServiceProtocol {
    func fetchCharacters() async throws -> [Character] {
        return characters
    }
}
