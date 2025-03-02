//
//  EpisodeDetailsViewModel.swift
//  StarWars
//
//  Created by Yuriy Gudimov on 28.02.25.
//

import Foundation

extension EpisodeDetailsView {
    class EpisodeDetailsViewModel: ObservableObject {
        let episode: Episode
        var releaseYear: String {
            let splittedDate = episode.releaseDate.split(separator: "-")
            return String(splittedDate[0])
        }
        
        init(episode: Episode) {
            self.episode = episode
        }
    }
}
