//
//  ArtistRepository.swift
//
//
//  Created by Ariel on 20/12/2023.
//

import Foundation
import Models

public protocol ArtistRepository {
    func getArtist(id: Int) async throws -> ArtistResponse
}

extension DefaultRepository: ArtistRepository {
    public func getArtist(id: Int) async throws -> ArtistResponse {
        let request = Endpoint.artist(id: String(id)).urlRequest
        let object = StorageObject.artist(id: id)
        return try await execute(request: request, object: object)
    }
}

extension Endpoint {
    static func artist(id: String) -> Self {
        Endpoint(
            path: "agents/\(id)",
            queryItems: [
                URLQueryItem(name: "fields", value: "id, title, description")
            ]
        )
    }
}
