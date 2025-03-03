//
//  Character.swift
//  StarWars
//
//  Created by Yuriy Gudimov on 28.02.25.
//

import Foundation

struct Character: Decodable {
    let id: UUID = UUID()
    let birthYear: String
    let eyeColor: String
    let films: [String]
    let gender: String
    let hairColor: String
    let height: String
    let homeworld: String
    let mass: String
    let name: String
    let skinColor: String
    let created: Date
    let edited: Date
    let species: [String]
    let starships: [String]
    let url: String
    let vehicles: [String]

    enum CodingKeys: String, CodingKey {
        case films, gender, height, homeworld, mass, name, created, edited, species, starships, url, vehicles
        case birthYear = "birth_year"
        case eyeColor = "eye_color"
        case hairColor = "hair_color"
        case skinColor = "skin_color"
    }
}

extension Character: Identifiable { }
