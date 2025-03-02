//
//  MockFilmsService.swift
//  StarWarsTests
//
//  Created by Yuriy Gudimov on 02.03.25.
//

import Foundation
@testable import StarWars

class MockFilmsService: FilmsServiceProtocol {
    var films: [Film] = []
    
    func fetchFilms() async throws -> [StarWars.Film] {
        return films
    }
}
