//
//  FilmsResponse.swift
//  StarWars
//
//  Created by Yuriy Gudimov on 27.02.25.
//

import Foundation

struct FilmsResponse: Decodable {
    let films: [Film]
    
    enum CodingKeys: String, CodingKey {
            case films = "results"
    }
}
