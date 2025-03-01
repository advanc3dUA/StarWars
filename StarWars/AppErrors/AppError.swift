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
    case charactersServiceError(CharactersServiceError)
    
    enum NetworkServiceError: Error {
        case failedRequest(Int)
        case failedToDecodeData(Error)
        case failedToConfigureDecoder
        case otherError(String)
    }
    
    enum FilmsServiceError: Error {
        case invalidURL
    }
    
    enum CharactersServiceError: Error {
        case invalidURL
    }
}
