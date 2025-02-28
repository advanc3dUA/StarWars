//
//  EpisodeDetailsViewModel.swift
//  StarWars
//
//  Created by Yuriy Gudimov on 28.02.25.
//

import Foundation

extension EpisodeDetailsView {
    final class EpisodeDetailsViewModel: ObservableObject {
        private let episode: Episode
        @Published var error: AppError?
        @Published var characters: [Character]?
        
        init(episode: Episode) {
            self.episode = episode
        }
    }
}
