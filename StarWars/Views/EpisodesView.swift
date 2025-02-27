//
//  EpisodesView.swift
//  StarWars
//
//  Created by Yuriy Gudimov on 27.02.25.
//

import SwiftUI

struct EpisodesView: View {
    @StateObject private var viewModel: EpisodesView.EpisodesViewModel
    
    init() {
        let networkService = NetworkService()
        let filmsService = FilmsService(networkService: networkService)
        self._viewModel = StateObject(wrappedValue: EpisodesViewModel(filmsService: filmsService))
    }
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onAppear {
                viewModel.fetchEpisodes()
            }
    }
}

#Preview {
    EpisodesView()
}
