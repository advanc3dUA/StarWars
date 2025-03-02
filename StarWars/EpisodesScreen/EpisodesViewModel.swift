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
            
            let charactersDictionary = makeDictionary(from: fetchedCharacters)
            let episodes = fetchedFilms.map { film -> Episode in
                let filmCharacters = film.characters.compactMap { charactersDictionary[$0] }
                return makeEpisode(from: film, characters: filmCharacters)
            }
            
            await MainActor.run {
                self.episodes = episodes
            }
        } catch {
            await MainActor.run {
                self.error = makeAppError(from: error)
                self.isShowingErrorAlert = true
            }
        }
    }
    
    private func makeDictionary(from characters: [Character]) -> [String: Character] {
        Dictionary(uniqueKeysWithValues: characters.map { ($0.url, $0) })
    }
    
    private func makeEpisode(from film: Film, characters: [Character]) -> Episode {
        Episode(
            title: film.title,
            releaseDate: film.releaseDate,
            director: film.director,
            episodeId: film.episodeId,
            openingCrawl: film.openingCrawl.removeLayout,
            url: film.url,
            characters: characters
        )
    }
    
    private func makeAppError(from error: Error) -> AppError {
        let appError: AppError
        if let convertedError = error as? AppError {
            appError = convertedError
        } else {
            appError = .networkServiceError(.otherError(error.localizedDescription))
        }
        return appError
    }
}

