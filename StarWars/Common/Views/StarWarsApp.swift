//
//  StarWarsApp.swift
//  StarWars
//
//  Created by Yuriy Gudimov on 27.02.25.
//

import SwiftUI

@main
struct StarWarsApp: App {
    private let networkService: NetworkService
    private let filmsService: FilmsService
    private let charactersService: CharactersService
    
    init() {
        self.networkService = NetworkService()
        self.filmsService = FilmsService(networkService: networkService)
        self.charactersService = CharactersService(networkService: networkService)
        
        applyStyle()
    }
    
    var body: some Scene {
        WindowGroup {
            EpisodesView(
                viewModel:
                    EpisodesViewModel(
                        filmsService: filmsService,
                        charactersService: charactersService
                    )
            )
            .preferredColorScheme(.light)
        }
    }
    
    private func applyStyle() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.black

        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
}
