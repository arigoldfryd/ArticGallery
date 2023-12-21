//
//  ArtistDataResponse.swift
//  
//
//  Created by Ariel on 20/12/2023.
//

import Foundation

public struct ArtistDataResponse: Codable, Equatable {
    public let id: Int?
    public let title: String?
    public let description: String?
    
    public init(id: Int?, title: String?, description: String?) {
        self.id = id
        self.title = title
        self.description = description
    }
}
