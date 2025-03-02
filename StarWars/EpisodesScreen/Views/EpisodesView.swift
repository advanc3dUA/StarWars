//
//  EpisodesView.swift
//  StarWars
//
//  Created by Yuriy Gudimov on 27.02.25.
//

import SwiftUI

struct EpisodesView: View {
    @StateObject var viewModel: EpisodesViewModel
    private var gridColumns: [GridItem] {
        [GridItem(.flexible()), GridItem(.flexible())]
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                BackgroundView()
                
                VStack {
                    LogoView()
                    
                    if let episodes = viewModel.episodes {
                        ScrollView {
                            LazyVGrid(columns: gridColumns, spacing: 10) {
                                ForEach(episodes) { episode in
                                    NavigationLink {
                                        EpisodeDetailsView(viewModel: EpisodeDetailsViewModel(episode: episode))
                                    } label: {
                                        EpisodeRowView(episode: episode)
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
        .alert("Error occurred", isPresented: $viewModel.isShowingErrorAlert) {
            Button("Ok", role: .cancel) { }
        } message: {
            Text("Here is your error message: \(String(describing: viewModel.error)). Please restart the app.")
        }
    }
}

#Preview {
    let networkService = NetworkService()
    let filmsService = FilmsService(networkService: networkService)
    let charactersService = CharactersService(networkService: networkService)
    EpisodesView(viewModel: EpisodesViewModel(filmsService: filmsService, charactersService: charactersService))
}
