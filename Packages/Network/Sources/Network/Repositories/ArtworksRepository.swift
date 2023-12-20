//
//  ArtworksRepository.swift
//
//
//  Created by Ariel on 19/12/2023.
//

import Foundation
import Models

public protocol ArtworksRepository {
    func getArtworks(page: Int) async throws -> ArtworksResponse
}

public class DefaultArtworksRepository {
    private let httpClient: HTTPClient
    
    public init(httpClient: HTTPClient = DefaultHTTPClient()) {
        self.httpClient = httpClient
    }
}

extension DefaultArtworksRepository: ArtworksRepository {
    public func getArtworks(page: Int) async throws -> ArtworksResponse {
        let urlRequest = URLRequest(url: Endpoint.artworks(page: page).url)
        return try await httpClient.perform(request: urlRequest)
    }
}

extension Endpoint {
    static func artworks(page: Int) -> Self {
        Endpoint(
            path: "artworks", 
            queryItems: [
                URLQueryItem(name: "page", value: "\(page)")
            ]
        )
    }
}
