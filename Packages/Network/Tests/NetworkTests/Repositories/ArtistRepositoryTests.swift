//
//  ArtistRepositoryTests.swift
//
//
//  Created by Ariel on 21/12/2023.
//

import XCTest
import Models
@testable import Network

final class ArtistRepositoryTests: XCTest {
    var httpClientMock: HTTPClientMock!
    var artistRepository: ArtistRepository!
    
    override func setUpWithError() throws {
        httpClientMock = HTTPClientMock()
        artistRepository = DefaultArtistRepository(httpClient: httpClientMock)
    }
    
    override func tearDownWithError() throws {
        httpClientMock = nil
        artistRepository = nil
    }
    
    func testGetArtistsFromNetwork() async throws {
        // Given
        let mockResponse = ArtistResponse(data: ArtistDataResponse(id: 1, title: "Title", description: "Description"))
        httpClientMock.responseData = try JSONEncoder().encode(mockResponse)

        // When
        let response = try await artistRepository.getArtist(id: 1)
        
        // Then
        XCTAssertEqual(response.data, mockResponse.data)
    }
    
    func testGetGenresThrowsErrorWhenHTTPClientThrowsError() async throws {
        // Given
        let expectedError = URLError(.notConnectedToInternet)
        httpClientMock.responseError = expectedError
        
        // When & Then
        do {
            _ = try await artistRepository.getArtist(id: 1)
            XCTFail("Expected an error to be thrown.")
        } catch {
            XCTAssertEqual(error as? URLError, expectedError)
        }
    }
}


