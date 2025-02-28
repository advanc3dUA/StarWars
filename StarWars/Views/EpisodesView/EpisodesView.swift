//
//  EpisodesView.swift
//  StarWars
//
//  Created by Yuriy Gudimov on 27.02.25.
//

import SwiftUI

struct EpisodesView: View {
    @StateObject private var viewModel: EpisodesView.EpisodesViewModel
    private var gridColumns: [GridItem] {
        [GridItem(.flexible()), GridItem(.flexible())]
    }
    
    init(filmsService: FilmsServiceProtocol, charactersService: CharactersServiceProtocol) {
        self._viewModel = StateObject(wrappedValue: EpisodesViewModel(filmsService: filmsService, charactersService: charactersService))
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                BackgroundView()
                    .ignoresSafeArea()
                
                VStack {
                    LogoView()
                    
                    if let episodes = viewModel.episodes {
                        ScrollView {
                            LazyVGrid(columns: gridColumns, spacing: 10) {
                                ForEach(episodes) { episode in
                                    NavigationLink {
                                        EpisodeDetailsView(episode: episode)
                                    } label: {
                                        EpisodeView(episode: episode)
                                    }
                                    
                                }
                            }
                        }
                        .scrollIndicators(.hidden)
                    } else {
                        ProgressView()
                    }
                }
            }
        }
        .onAppear {
            Task { await viewModel.fetchData() }
        }
    }
}

#Preview {
    let networkService = NetworkService()
    let filmsSerivce = FilmsService(networkService: networkService)
    let charactersService = CharactersService(networkService: networkService)
    EpisodesView(filmsService: filmsSerivce, charactersService: charactersService)
}
