//
//  NetworkServiceProtocol.swift
//  StarWars
//
//  Created by Yuriy Gudimov on 27.02.25.
//

import Foundation

protocol NetworkServiceProtocol {
    func fetchData<T: Decodable>(from url: URL, as type: T.Type) async throws -> T
}
