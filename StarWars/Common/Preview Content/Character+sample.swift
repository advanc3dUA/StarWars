//
//  Character+sample.swift
//  StarWars
//
//  Created by Yuriy Gudimov on 02.03.25.
//

import Foundation

extension Character {
    static let sample = Character(
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

    static var samplesArray: [Character] {
        var array: [Character] = []
        (1...10).forEach { number in
            array.append(Character(from: .sample, with: "https://\(number).de"))
        }
        return array
    }
}
