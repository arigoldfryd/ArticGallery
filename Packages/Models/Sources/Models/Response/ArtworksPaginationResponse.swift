//
//  ArtworksPaginationResponse.swift
//
//
//  Created by Ariel on 19/12/2023.
//

import Foundation

public struct ArtworksPaginationResponse: Codable, Equatable {
    public let total: Int
    public let limit: Int
    public let offset: Int?
    public let totalPages: Int
    public let currentPage: Int
    public let nextUrl: String?
    
    public init(total: Int, limit: Int, offset: Int?, totalPages: Int, currentPage: Int, nextUrl: String?) {
        self.total = total
        self.limit = limit
        self.offset = offset
        self.totalPages = totalPages
        self.currentPage = currentPage
        self.nextUrl = nextUrl
    }
}
