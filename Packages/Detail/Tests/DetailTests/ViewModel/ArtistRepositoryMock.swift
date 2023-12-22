//
//  File.swift
//  
//
//  Created by Ariel on 22/12/2023.
//

import Foundation
import Network
import Models
@testable import Detail

@MainActor
@Observable class ArtistRepositoryMock: ArtistRepository {
    var getArtistCount = 0
    
    var fail = false
    var response: ArtistResponse = {
        let data = ArtistDataResponse(id: 1, title: "Title", description: "Description")
        return ArtistResponse(data: data)
    }()
    
    func getArtist(id: Int) async throws -> ArtistResponse {
        getArtistCount += 1
        
        if fail {
            throw NSError(domain: "ArtistRepositoryMock", code: 1, userInfo: [NSLocalizedDescriptionKey: "Throwing a test error"])
        }
        
        return response
    }
    
    
}

