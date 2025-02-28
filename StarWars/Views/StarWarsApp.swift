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
    
    init() {
        self.networkService = NetworkService()
        self.filmsService = FilmsService(networkService: networkService)
    }
    
    var body: some Scene {
        WindowGroup {
            EpisodesView(filmsService: filmsService)
        }
    }
}
