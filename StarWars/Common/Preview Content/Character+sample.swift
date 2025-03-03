//
//  Character+sample.swift
//  StarWars
//
//  Created by Yuriy Gudimov on 02.03.25.
//

import Foundation

extension Character {
    static let sampleCharacter = Character(
        birthYear: "1975",
        eyeColor: "Brown",
        films: [""],
        gender: "Female",
        hairColor: "Blonde",
        height: "1.77",
        homeworld: "Tauten",
        mass: "60",
        name: "Leah Organa",
        skinColor: "White",
        created: Date(),
        edited: Date(),
        species: [""],
        starships: [""],
        url: "",
        vehicles: [""]
    )

    static let sampleCharacters: [Character] = Array(repeating: .sampleCharacter, count: 10)
}
