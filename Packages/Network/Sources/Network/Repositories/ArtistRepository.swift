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

public class DefaultArtistRepository {
    private let httpClient: HTTPClient
    
    public init(httpClient: HTTPClient = DefaultHTTPClient()) {
        self.httpClient = httpClient
    }
}

extension DefaultArtistRepository: ArtistRepository {
    public func getArtist(id: Int) async throws -> ArtistResponse {
        let urlRequest = URLRequest(url: Endpoint.artist(id: String(id)).url)
        return try await httpClient.perform(request: urlRequest)
    }
}

extension Endpoint {
    static func artist(id: String) -> Self {
        Endpoint(path: "agents/\(id)")
    }
}
