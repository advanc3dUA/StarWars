//
//  Episode+sample.swift
//  StarWars
//
//  Created by Yuriy Gudimov on 02.03.25.
//

import Foundation

extension Episode {
    static let sample = Episode(
        title: "The episode title",
        releaseDate: "1987-05-25",
        director: "Yuriy Gudimov",
        episodeId: 1,
        openingCrawl: "Long long time ago in a galaxy far, far away...",
        url: "",
        characters: Character.samplesArray
    )
}
