//
//  API.swift
//  StarWars
//
//  Created by Yuriy Gudimov on 02.03.25.
//

import Foundation

enum API: String {
    case films
    case people
}

extension API {
    var baseURL: String {
        "https://swapi.dev/api/"
    }
    
    var path: String {
        baseURL + self.rawValue
    }
}
