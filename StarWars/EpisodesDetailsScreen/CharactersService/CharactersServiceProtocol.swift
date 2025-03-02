//
//  CharactersServiceProtocol.swift
//  StarWars
//
//  Created by Yuriy Gudimov on 28.02.25.
//

import Foundation

protocol CharactersServiceProtocol {
    func fetchCharacters() async throws -> [Character]
}
