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

extension DefaultRepository: ArtworksRepository {
    public func getArtworks(page: Int) async throws -> ArtworksResponse {
        let request = Endpoint.artworks(page: page).urlRequest
        let object = StorageObject.artworks(page: page)
        return try await execute(request: request, object: object)
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
