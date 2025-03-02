//
//  FilmsServiceProtocol.swift
//  StarWars
//
//  Created by Yuriy Gudimov on 27.02.25.
//

import Foundation

protocol FilmsServiceProtocol {
    func fetchFilms() async throws -> [Film]
}
