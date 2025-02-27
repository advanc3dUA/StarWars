//
//  AppError.swift
//  StarWars
//
//  Created by Yuriy Gudimov on 27.02.25.
//

import Foundation

enum AppError: Error {
    case networkServiceError(NetworkServiceError)
    case filmsServiceError(FilmsServiceError)
    
    enum NetworkServiceError: Error {
        case failedRequest(Int)
        case failedToDecodeData(Error)
        case failedToConfigureDecoder
    }
    
    enum FilmsServiceError: Error {
        case invalidURL
    }
}
