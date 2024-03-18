//
//  MovieService.swift
//  MovieDBApp
//
//  Created by Veena Kethineedi on 3/17/24.
//

import Foundation

enum MovieServiceError: Error {
    case invalidResponse
}

/* actors are conceptually like classes that are safe to use in concurrent environments. This safety is made possible because Swift automatically ensures no two pieces of code attempt to access an actor’s data at the same time */
actor MovieService {
    func fetchData<T: Decodable>(api: ApiConstructor) async throws -> T {
        let url = try DefaultUrlBuilder.build(api: api)
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let response = response as? HTTPURLResponse, response.statusCode >= 200 && response.statusCode < 300 else {
            throw MovieServiceError.invalidResponse
        }
        return try JSONDecoder().decode(T.self, from: data)
    }
}
