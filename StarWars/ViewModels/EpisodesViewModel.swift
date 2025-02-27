//
//  EpisodesViewModel.swift
//  StarWars
//
//  Created by Yuriy Gudimov on 27.02.25.
//

import SwiftUI

extension EpisodesView {
    final class EpisodesViewModel: ObservableObject {
        let filmsService: FilmsServiceProtocol
        
        init(filmsService: FilmsServiceProtocol) {
            self.filmsService = filmsService
        }
        
        func fetchEpisodes() {
            
        }
        
    }
}

