//
//  FailingFilmsService.swift
//  StarWarsTests
//
//  Created by Yuriy Gudimov on 02.03.25.
//

import Foundation
@testable import StarWars

class FailingFilmsService: FilmsServiceProtocol {
    enum TestError: Error { case simulatedError }
    
    func fetchFilms() async throws -> [Film] {
        throw TestError.simulatedError
    }
}
