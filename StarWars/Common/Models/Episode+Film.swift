//
//  Episode+Film.swift
//  StarWars
//
//  Created by Yuriy Gudimov on 02.03.25.
//

import Foundation

extension Episode {
    init(from film: Film, with characters: [Character]) {
        self.title = film.title
        self.releaseDate = film.releaseDate
        self.director = film.director
        self.episodeId = film.episodeId
        self.openingCrawl = film.openingCrawl.removeLayout
        self.url = film.url
        self.characters = characters
    }
}
