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
                makeEpisode(from: film, charactersDictionary: charactersDictionary)
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

    private func makeEpisode(from film: Film, charactersDictionary: [String: Character]) -> Episode {
        let filmCharacters = film.characters.compactMap { charactersDictionary[$0] }
        return Episode(from: film, with: filmCharacters)
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
