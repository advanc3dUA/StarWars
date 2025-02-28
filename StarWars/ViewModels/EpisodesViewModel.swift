//
//  EpisodesViewModel.swift
//  StarWars
//
//  Created by Yuriy Gudimov on 27.02.25.
//

import SwiftUI

extension EpisodesView {
    final class EpisodesViewModel: ObservableObject {
        private let filmsService: FilmsServiceProtocol
        @Published var films: [Film]?
        @Published var error: AppError?
        
        init(filmsService: FilmsServiceProtocol) {
            self.filmsService = filmsService
        }
        
        func fetchEpisodes() async {
            do {
                let fetchedFilms = try await filmsService.fetchFilms()
                
                await updateOnMainThread {
                    self.films = fetchedFilms
                    print("SUCCESS")
                    films?.forEach({ film in
                        print(film.title)
                    })
                }
            } catch {
                if let error = error as? AppError {
                    await updateOnMainThread {
                        self.error = error
                    }
                }
            }
        }
        
        private func updateOnMainThread(_ action: () -> Void) async {
            await MainActor.run {
                action()
            }
        }
    }
}

