//
//  Film.swift
//  StarWars
//
//  Created by Yuriy Gudimov on 27.02.25.
//

import Foundation

struct Film: Decodable {
    let characters: [String]
    let created: Date
    let director: String
    let edited: Date
    let episodeId: Int
    let openingCrawl: String
    let planets: [String]
    let producer: String
    let releaseDate: String
    let species: [String]
    let starships: [String]
    let title: String
    let url: String
    let vehicles: [String]

    enum CodingKeys: String, CodingKey {
        case characters, created, director, edited, planets, producer, species, starships, title, url, vehicles
        case episodeId = "episode_id"
        case openingCrawl = "opening_crawl"
        case releaseDate = "release_date"
    }
}

extension Film {
    init(from film: Film, with url: String) {
        self.characters = film.characters
        self.created = film.created
        self.director = film.director
        self.edited = film.edited
        self.episodeId = film.episodeId
        self.openingCrawl = film.openingCrawl
        self.planets = film.planets
        self.producer = film.producer
        self.releaseDate = film.releaseDate
        self.species = film.species
        self.starships = film.starships
        self.title = film.title
        self.url = url
        self.vehicles = film.vehicles
    }
}
