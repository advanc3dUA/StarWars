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
    }
    
    var body: some Scene {
        WindowGroup {
            EpisodesView(filmsService: filmsService, charactersService: charactersService)
                .preferredColorScheme(.light)
        }
    }
}
