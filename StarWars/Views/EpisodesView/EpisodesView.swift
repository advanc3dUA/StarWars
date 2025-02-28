//
//  EpisodesView.swift
//  StarWars
//
//  Created by Yuriy Gudimov on 27.02.25.
//

import SwiftUI

struct EpisodesView: View {
    @StateObject private var viewModel: EpisodesView.EpisodesViewModel
    @State private var screenSize: CGSize?
    private var gridColumns: [GridItem] {
        [GridItem(.flexible()), GridItem(.flexible())]
    }
    
    init(filmsService: FilmsServiceProtocol) {
        self._viewModel = StateObject(wrappedValue: EpisodesViewModel(filmsService: filmsService))
    }
    
    var body: some View {
        ZStack {
            BackgroundView()
                .ignoresSafeArea()
            
            VStack {
                LogoView()
                
                if let films = viewModel.films {
                    ScrollView {
                        LazyVGrid(columns: gridColumns, spacing: 10) {
                            ForEach(films) { film in
                                EpisodeView(film: film)
                            }
                        }
                    }
                    .scrollIndicators(.hidden)
                } else {
                    ProgressView()
                }
            }
        }
        .onAppear {
            Task { await viewModel.fetchEpisodes() }
        }
    }
}

#Preview {
    let filmsSerivce = FilmsService(networkService: NetworkService())
    EpisodesView(filmsService: filmsSerivce)
}
