//
//  Artist.swift
//
//
//  Created by Ariel on 20/12/2023.
//

import Foundation

public struct Artist: Hashable {
    public let id: Int
    public let title: String
    public let description: String?
    
    public init() {
        self.init(id: 0, title: "", description: nil)
    }
    
    public init(id: Int, title: String, description: String?) {
        self.id = id
        self.title = title
        self.description = description
    }
    
    static func placeholder() -> Artist {
        return Artist(id: 1, title: "Pat Steir", description: nil)
    }
}
