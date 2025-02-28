//
//  EpisodesView.swift
//  StarWars
//
//  Created by Yuriy Gudimov on 27.02.25.
//

import SwiftUI

struct EpisodesView: View {
    @StateObject private var viewModel: EpisodesView.EpisodesViewModel
    
    init(filmsService: FilmsServiceProtocol) {
        self._viewModel = StateObject(wrappedValue: EpisodesViewModel(filmsService: filmsService))
    }
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onAppear {
                Task { await viewModel.fetchEpisodes() }
            }
    }
}

#Preview {
    let filmsSerivce = FilmsService(networkService: NetworkService())
    EpisodesView(filmsService: filmsSerivce)
}
