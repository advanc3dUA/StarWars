//
//  MockFilmsService.swift
//  StarWarsTests
//
//  Created by Yuriy Gudimov on 02.03.25.
//

import Foundation
@testable import StarWars

class MockFilmsService {
    var films: [Film] = []
}

extension MockFilmsService: FilmsServiceProtocol {
    func fetchFilms() async throws -> [StarWars.Film] {
        return films
    }
}
