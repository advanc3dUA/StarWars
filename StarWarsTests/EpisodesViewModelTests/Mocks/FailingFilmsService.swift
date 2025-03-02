//
//  FailingFilmsService.swift
//  StarWarsTests
//
//  Created by Yuriy Gudimov on 02.03.25.
//

import Foundation
@testable import StarWars

class FailingFilmsService {
    enum TestError: Error { case simulatedError }
}

extension FailingFilmsService: FilmsServiceProtocol {
    func fetchFilms() async throws -> [Film] {
        throw TestError.simulatedError
    }
}
