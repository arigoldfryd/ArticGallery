//
//  ArtworksResponse.swift
//
//
//  Created by Ariel on 19/12/2023.
//

import Foundation

public struct ArtworksResponse: Codable {
    public let pagination: ArtworksPaginationResponse
    public let data: [ArtworksDataResponse]
}
