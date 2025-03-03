//
//  FilmsService.swift
//  StarWars
//
//  Created by Yuriy Gudimov on 27.02.25.
//

import Foundation

protocol FilmsServiceProtocol {
    func fetchFilms() async throws -> [Film]
}

class FilmsService {
    private let networkService: NetworkServiceProtocol

    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
}

extension FilmsService: FilmsServiceProtocol {
    func fetchFilms() async throws -> [Film] {
        guard let url = URL(string: API.films.path) else {
            throw AppError.filmsServiceError(.invalidURL)
        }

        let response = try await networkService.fetchData(from: url, as: FilmsResponse.self)
        return response.films
    }
}
