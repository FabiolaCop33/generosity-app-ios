//
//  ClienteCentroBondand.swift
//  Generosity
//
//  Created by Familia Alvarado Perez on 25/06/24.
//

import Foundation

struct ClienteCentroBondad {
  static let shared = ClienteCentroBondad()
  private init() { }

    private enum ErrorClienteCentroBondad: Error {
        case invalidResponse
        case decodingError(Error)
    }

struct GenerosityResponse: Decodable {
        let results: [CentroBondad] // Array of CentroBondad structs
    }
    
  func fetchCentrosBondad(at url: URL) async throws -> GenerosityResponse {
    print("Fetching centrosBondad from: \(url)") // Print the URL being used
    let (data, response) = try await URLSession.shared.data(from: url)
    print("Received response: \(response)") // Print the HTTP response

    guard let httpResponse = response as? HTTPURLResponse,
          httpResponse.statusCode == 200 else {
      throw ErrorClienteCentroBondad.invalidResponse
    }
    print("Response status code: \(httpResponse.statusCode)") // Print the status code

    do {
      let decoder = JSONDecoder()
      // New print statement to inspect raw data:
      print("Raw JSON data:")
      print(String(data: data, encoding: .utf8) ?? "Failed to print data")
      let response = try decoder.decode(GenerosityResponse.self, from: data)
        print("Successfully decoded \(response.results.count) CentroBondad objects.") // Print after successful decoding
      return response
    } catch {
      print("Decoding error: \(error.localizedDescription)") // Print the error description
      throw ErrorClienteCentroBondad.decodingError(error)
    }
  }
}
