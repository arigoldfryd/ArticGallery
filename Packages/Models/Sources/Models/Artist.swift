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
    public let birthDate: String?
    public let deathDate: String?
    public let description: String?
    
    public init(id: Int, title: String, birthDate: String?, deathDate: String?, description: String?) {
        self.id = id
        self.title = title
        self.birthDate = birthDate
        self.deathDate = deathDate
        self.description = description
    }
    
    public init(id: Int, title: String) {
        self.id = id
        self.title = title
        self.birthDate = nil
        self.deathDate = nil
        self.description = nil
    }
}
