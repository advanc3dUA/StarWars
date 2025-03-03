//
//  EpisodeDetailsViewModel.swift
//  StarWars
//
//  Created by Yuriy Gudimov on 28.02.25.
//

import Foundation

class EpisodeDetailsViewModel: ObservableObject {
    let episode: Episode
    var releaseYear: String {
        let splitDate = episode.releaseDate.split(separator: "-")
        return String(splitDate[0])
    }

    init(episode: Episode) {
        self.episode = episode
    }
}
