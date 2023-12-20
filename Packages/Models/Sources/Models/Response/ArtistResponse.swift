//
//  ArtistResponse.swift
//  
//
//  Created by Ariel on 20/12/2023.
//

import Foundation

public struct ArtistResponse: Codable {
    public let id: Int?
    public let title: String?
    public let birthDate: String?
    public let deathDate: String?
    public let description: String?
}
