//
//  FilmsServiceProtocol.swift
//  StarWars
//
//  Created by Yuriy Gudimov on 27.02.25.
//

import Foundation

protocol FilmsServiceProtocol {
    func fetchPlanets() async throws -> [Film]
}
