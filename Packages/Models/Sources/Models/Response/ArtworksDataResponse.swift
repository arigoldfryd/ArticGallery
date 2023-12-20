//
//  ArtworksDataResponse.swift
//
//
//  Created by Ariel on 19/12/2023.
//

import Foundation

public struct ArtworksDataResponse: Codable {
    public let id: Int
    public let title: String
    public let artistId: Int?
    public let artistDisplay: String?
    public let imageId: String?
    public let placeOfOrigin: String?
    public let mediumDisplay: String?
}
