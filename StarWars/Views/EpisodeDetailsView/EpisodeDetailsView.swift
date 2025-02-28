//
//  EpisodeDetailsView.swift
//  StarWars
//
//  Created by Yuriy Gudimov on 28.02.25.
//

import SwiftUI

struct EpisodeDetailsView: View {
    @StateObject private var viewModel: EpisodeDetailsViewModel
    
    init(episode: Episode) {
        self._viewModel = StateObject(wrappedValue: EpisodeDetailsView.EpisodeDetailsViewModel(episode: episode))
    }
    
    var body: some View {
        ZStack {
            BackgroundView()
        }
    }
}

#Preview {
    let characters = [Character(birthYear: "1966", eyeColor: "Brown", films: [""], gender: "", hairColor: "", height: "", homeworld: "", mass: "", name: "Yuriy Gudimov", skinColor: "", created: Date(), edited: Date(), species: [""], starships: [""], url: "", vehicles: [""])]
    let episode = Episode(title: "The episode title", releaseDate: "1987-05-25", director: "Yuriy Gudimov", episodeId: 1, openingCrawl: "Long long time ago in a galaxy far, far away...", url: "", characters: characters)
    EpisodeDetailsView(episode: episode)
}
