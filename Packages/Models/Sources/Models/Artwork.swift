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
    public let artistId: Int?
    public let artistDisplay: String?
    public let imageURL: String?
    public let placeOfOrigin: String
    public let mediumDisplay: String?
    
    public init(id: Int, title: String, artistId: Int?, artistDisplay: String?, imageURL: String?, placeOfOrigin: String, mediumDisplay: String?) {
        self.id = id
        self.title = title
        self.artistId = artistId
        self.artistDisplay = artistDisplay
        self.imageURL = imageURL
        self.placeOfOrigin = placeOfOrigin
        self.mediumDisplay = mediumDisplay
    }
    
    public static func placeholder() -> Artwork {
        return Artwork(id: 1, title: "Form", artistId: 1, artistDisplay: "Name \nUnited States, born 1928", imageURL: "https://www.artic.edu/iiif/2/d349a360-3690-bbc4-5883-22f4cd8bac84/full/843,/0/default.jpg", placeOfOrigin: "United States", mediumDisplay: "Colored pencil, over graphite, on cream wove paper")
    }
}
