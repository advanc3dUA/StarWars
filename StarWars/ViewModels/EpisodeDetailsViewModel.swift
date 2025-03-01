//
//  EpisodeDetailsViewModel.swift
//  StarWars
//
//  Created by Yuriy Gudimov on 28.02.25.
//

import Foundation

extension EpisodeDetailsView {
    final class EpisodeDetailsViewModel: ObservableObject {
        let episode: Episode
        @Published var error: AppError?
        @Published var characters: [Character]?
        var releaseYear: String {
            let splittedDate = episode.releaseDate.split(separator: "-")
            return String(splittedDate[0])
        }
        
        init(episode: Episode) {
            self.episode = episode
        }
    }
}
