//
//  ArtworksDataResponse.swift
//
//
//  Created by Ariel on 19/12/2023.
//

import Foundation

public struct ArtworksDataResponse: Codable, Equatable {
    public let id: Int
    public let title: String
    public let artistId: Int?
    public let artistDisplay: String?
    public let imageId: String?
    public let placeOfOrigin: String?
    public let mediumDisplay: String?
    
    public init(id: Int, title: String, artistId: Int?, artistDisplay: String?, imageId: String?, placeOfOrigin: String?, mediumDisplay: String?) {
        self.id = id
        self.title = title
        self.artistId = artistId
        self.artistDisplay = artistDisplay
        self.imageId = imageId
        self.placeOfOrigin = placeOfOrigin
        self.mediumDisplay = mediumDisplay
    }
}
