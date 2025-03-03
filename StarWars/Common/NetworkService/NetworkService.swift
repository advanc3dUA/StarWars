//
//  NetworkService.swift
//  StarWars
//
//  Created by Yuriy Gudimov on 27.02.25.
//

import Foundation

protocol NetworkServiceProtocol {
    func fetchData<Response: Decodable>(from url: URL, as type: Response.Type) async throws -> Response
}

class NetworkService {
    private let decoder: JSONDecoder

    init() {
        self.decoder = JSONDecoder()
        configureDecoder()
    }

    private func configureDecoder() {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]

        decoder.dateDecodingStrategy = .custom { decoder in
            let container = try decoder.singleValueContainer()
            let dateString = try container.decode(String.self)
            if let date = formatter.date(from: dateString) {
                return date
            } else {
                throw AppError.networkServiceError(.failedToConfigureDecoder)
            }
        }
    }
}

extension NetworkService: NetworkServiceProtocol {
    func fetchData<Response: Decodable>(from url: URL, as type: Response.Type) async throws -> Response {
        let (data, response) = try await URLSession.shared.data(from: url)

        if let httpResponse = response as? HTTPURLResponse,
           !(200...299).contains(httpResponse.statusCode) {
            throw AppError.networkServiceError(.failedRequest(httpResponse.statusCode))
        }

        do {
            let decodedData = try decoder.decode(type, from: data)
            return decodedData
        } catch {
            throw AppError.networkServiceError(.failedToDecodeData(error))
        }
    }
}
