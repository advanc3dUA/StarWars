//
//  FilmsService.swift
//  StarWars
//
//  Created by Yuriy Gudimov on 27.02.25.
//

import Foundation

final class FilmsService: FilmsServiceProtocol {
    private let urlString = "https://swapi.dev/api/films/"
    private let networkService: NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
    
    func fetchFilms() async throws -> [Film] {
        guard let url = URL(string: urlString) else {
            throw AppError.filmsServiceError(.invalidURL)
        }
        
        let response = try await networkService.fetchData(from: url, as: FilmsResponse.self)
        return response.films
    }
}
