//
//  ClienteCentroBondand.swift
//  Generosity
//
//  Created by Familia Alvarado Perez on 25/06/24.
//

import Foundation

struct Networking {
    static let shared = Networking()
    private init() { }
    
    private enum ClientErrorCentroBondad: Error {
        case invalidResponse
        case decodingError(Error)
    }
    
    struct GenerosityResponse: Decodable {
        let results: [CentroBondadModel]
    }
    
    func fetchCentrosBondad(at url: URL) async throws -> GenerosityResponse {
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw ClientErrorCentroBondad.invalidResponse
        }
        do {
            let decoder = JSONDecoder()
            let response = try decoder.decode(GenerosityResponse.self, from: data)
            return response
        } catch {
            throw ClientErrorCentroBondad.decodingError(error)
        }
    }
}
