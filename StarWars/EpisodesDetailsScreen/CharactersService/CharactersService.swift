//
//  CharactersService.swift
//  StarWars
//
//  Created by Yuriy Gudimov on 28.02.25.
//

import Foundation

final class CharactersService: CharactersServiceProtocol {
    private let urlString = "https://swapi.dev/api/people/"
    private let networkService: NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
    
    func fetchCharacters() async throws -> [Character] {
        guard let url = URL(string: urlString) else {
            throw AppError.charactersServiceError(.invalidURL)
        }
        
        let response = try await networkService.fetchData(from: url, as: CharactersResponse.self)
        return response.characters
    }
}
