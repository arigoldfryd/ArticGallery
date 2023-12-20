//
//  Artwork.swift
//  
//
//  Created by Ariel on 19/12/2023.
//

import Foundation

public struct Artwork: Hashable {
    public let id: Int
    public let title: String
    public let artist: String
    public let imageURL: String?
    
    public init(id: Int, title: String, artist: String, imageURL: String?) {
        self.id = id
        self.title = title
        self.artist = artist
        self.imageURL = imageURL
    }
}
