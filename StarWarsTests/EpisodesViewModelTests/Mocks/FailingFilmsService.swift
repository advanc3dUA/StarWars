//
//  FailingFilmsService.swift
//  StarWarsTests
//
//  Created by Yuriy Gudimov on 02.03.25.
//

import Foundation
@testable import StarWars

class FailingFilmsService {
    var error: Error

    init(error: Error) {
        self.error = error
    }
}

extension FailingFilmsService: FilmsServiceProtocol {
    func fetchFilms() async throws -> [Film] {
        throw error
    }
}
