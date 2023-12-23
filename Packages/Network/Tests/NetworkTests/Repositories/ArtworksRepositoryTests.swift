//
//  ArtworksRepositoryTests.swift
//
//
//  Created by Ariel on 21/12/2023.
//

import XCTest
import Models
@testable import Network

final class ArtworksRepositoryTests: XCTest {
    var httpClientMock: HTTPClientMock!
    var artworksRepository: ArtworksRepository!
    
    override func setUpWithError() throws {
        httpClientMock = HTTPClientMock()
        artworksRepository = DefaultRepository(httpClient: httpClientMock)
    }
    
    override func tearDownWithError() throws {
        httpClientMock = nil
        artworksRepository = nil
    }
    
    func testGetArtistsFromNetwork() async throws {
        // Given
        let pagination = ArtworksPaginationResponse(total: 10, limit: 10, offset: nil, totalPages: 10, currentPage: 1, nextUrl: nil)
        
        let mockResponse = ArtworksResponse(pagination: pagination, data: [
            ArtworksDataResponse(id: 1, title: "Title", artistId: nil, artistDisplay: nil, imageId: nil, placeOfOrigin: nil, mediumDisplay: nil),
            ArtworksDataResponse(id: 2, title: "Title2", artistId: nil, artistDisplay: nil, imageId: nil, placeOfOrigin: nil, mediumDisplay: nil),
            ArtworksDataResponse(id: 3, title: "Title3", artistId: nil, artistDisplay: nil, imageId: nil, placeOfOrigin: nil, mediumDisplay: nil),
        ])
        
        httpClientMock.responseData = try JSONEncoder().encode(mockResponse)
        
        // When
        let response = try await artworksRepository.getArtworks(page: 1)
        
        // Then
        XCTAssertEqual(response, mockResponse)
    }
    
    func testGetGenresThrowsErrorWhenHTTPClientThrowsError() async throws {
        // Given
        let expectedError = URLError(.notConnectedToInternet)
        httpClientMock.responseError = expectedError
        
        // When & Then
        do {
            _ = try await artworksRepository.getArtworks(page: 1)
            XCTFail("Expected an error to be thrown.")
        } catch {
            XCTAssertEqual(error as? URLError, expectedError)
        }
    }
}


