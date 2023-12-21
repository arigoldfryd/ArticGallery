//
//  ArtworksResponse.swift
//
//
//  Created by Ariel on 19/12/2023.
//

import Foundation

public struct ArtworksResponse: Codable, Equatable {
    public static func == (lhs: ArtworksResponse, rhs: ArtworksResponse) -> Bool {
        return lhs.data == rhs.data
    }
    
    public let pagination: ArtworksPaginationResponse
    public let data: [ArtworksDataResponse]
    
    public init(pagination: ArtworksPaginationResponse, data: [ArtworksDataResponse]) {
        self.pagination = pagination
        self.data = data
    }
}
