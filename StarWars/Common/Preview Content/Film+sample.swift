//
//  Film+sample.swift
//  StarWars
//
//  Created by Yuriy Gudimov on 03.03.25.
//

import Foundation

extension Film {
    static let sample = Film(
        characters: [""],
        created: Date(),
        director: "Creative Person",
        edited: Date(),
        episodeId: 1,
        openingCrawl: "Long long long text here",
        planets: [""],
        producer: "Another Guy",
        releaseDate: "2020-02-28",
        species: [""],
        starships: [""],
        title: "AI vs Clones",
        url: "",
        vehicles: [""]
    )

    static var samplesArray: [Film] {
        var array: [Film] = []
        (1...10).forEach { number in
            array.append(Film(from: .sample, with: "https://\(number).de"))
        }
        return array
    }
}
