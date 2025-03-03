//
//  CharactersResponse.swift
//  StarWars
//
//  Created by Yuriy Gudimov on 28.02.25.
//

import Foundation

struct CharactersResponse: Decodable {
    let characters: [Character]

    enum CodingKeys: String, CodingKey {
            case characters = "results"
    }
}
