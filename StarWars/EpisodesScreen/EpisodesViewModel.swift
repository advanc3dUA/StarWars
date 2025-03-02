//
//  EpisodesViewModel.swift
//  StarWars
//
//  Created by Yuriy Gudimov on 27.02.25.
//

import SwiftUI

class EpisodesViewModel: ObservableObject {
    private let filmsService: FilmsServiceProtocol
    private let charactersService: CharactersServiceProtocol
    @Published var episodes: [Episode]?
    @Published var error: AppError?
    @Published var isShowingErrorAlert: Bool = false
    
    init(filmsService: FilmsServiceProtocol, charactersService: CharactersServiceProtocol) {
        self.filmsService = filmsService
        self.charactersService = charactersService
    }
    
    func fetchData() async {
        do {
            async let filmsTask = filmsService.fetchFilms()
            async let charactersTask = charactersService.fetchCharacters()
            let (fetchedFilms, fetchedCharacters) = try await (filmsTask, charactersTask)
            
            // Build a dictionary for fast lookup.
            let charactersDict = Dictionary(uniqueKeysWithValues: fetchedCharacters.map { ($0.url, $0) })
            // Map Films and Charaters into Episode
            let episodes = fetchedFilms.map { film -> Episode in
                let filmCharacters = film.characters.compactMap { charactersDict[$0] }
                return Episode(
                    title: film.title,
                    releaseDate: film.releaseDate,
                    director: film.director,
                    episodeId: film.episodeId,
                    openingCrawl: removeTextLayout(for: film.openingCrawl),
                    url: film.url,
                    characters: filmCharacters
                )
            }
            
            await MainActor.run {
                self.episodes = episodes
            }
        } catch {
            let appError: AppError
            if let convertedError = error as? AppError {
                appError = convertedError
            } else {
                appError = .networkServiceError(.otherError(error.localizedDescription))
            }
            
            await MainActor.run {
                self.error = appError
                self.isShowingErrorAlert = true
            }
        }
    }
    
    private func removeTextLayout(for text: String) -> String {
        text
            .replacingOccurrences(of: "\r", with: "")
            .replacingOccurrences(of: "\n", with: " ")
    }
}

