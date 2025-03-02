//
//  Episode.swift
//  StarWars
//
//  Created by Yuriy Gudimov on 28.02.25.
//

import Foundation

struct Episode: Identifiable {
    let id: UUID = UUID()
    let title: String
    let releaseDate: String
    let director: String
    let episodeId: Int
    let openingCrawl: String
    let url: String
    let characters: [Character]
}
