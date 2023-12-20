//
//  ArtworksDataResponse.swift
//
//
//  Created by Ariel on 19/12/2023.
//

import Foundation

public struct ArtworksDataResponse: Codable, Hashable {
    public let id: Int
    public let title: String
    public let artistTitle: String?
    public let imageId: String?
}