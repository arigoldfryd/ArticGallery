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
    
    public init(id: Int, title: String) {
        self.id = id
        self.title = title
    }
}
