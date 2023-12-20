//
//  ArtworksPaginationResponse.swift
//
//
//  Created by Ariel on 19/12/2023.
//

import Foundation

public struct ArtworksPaginationResponse: Codable {
    public let total: Int?
    public let limit: Int?
    public let offset: Int?
    public let totalPages: Int?
    public let currentPage: Int?
    public let nextUrl: String?
}
