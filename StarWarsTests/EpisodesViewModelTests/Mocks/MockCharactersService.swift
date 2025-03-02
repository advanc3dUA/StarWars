//
//  MockCharactersService.swift
//  StarWarsTests
//
//  Created by Yuriy Gudimov on 02.03.25.
//

import Foundation
@testable import StarWars

class MockCharactersService: CharactersServiceProtocol {
    var characters: [Character] = []
    
    func fetchCharacters() async throws -> [Character] {
        return characters
    }
}
