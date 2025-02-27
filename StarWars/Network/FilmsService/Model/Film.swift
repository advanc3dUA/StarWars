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
