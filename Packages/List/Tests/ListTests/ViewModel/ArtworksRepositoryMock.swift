//
//  ArtworksRepositoryMock.swift
//
//
//  Created by Ariel on 21/12/2023.
//

import Foundation
import Network
import Models
@testable import List

@MainActor
@Observable class ArtworksRepositoryMock: ArtworksRepository {

    var getArtworksCounter = 0
    
    var fail = false
    var response: ArtworksResponse = {
        let pagination = ArtworksPaginationResponse(total: 1, limit: 1, offset: nil, totalPages: 3, currentPage: 1, nextUrl: nil)
        let data = [ArtworksDataResponse(id: 1, title: "Title", artistId: 10, artistDisplay: "ArtistDisplay", imageId: "11", placeOfOrigin: "PlaceOfOrigin", mediumDisplay: "MediumDisplay")]
        return ArtworksResponse(pagination: pagination, data: data)
    }()

    func getArtworks(page: Int) async throws -> ArtworksResponse {
        getArtworksCounter += 1
        
        if fail {
            throw NSError(domain: "ArtworksRepositoryError", code: 1, userInfo: [NSLocalizedDescriptionKey: "Throwing a test error"])
        }
        
        return response
    }
}
