//
//  ListViewModelTests.swift
//
//
//  Created by Ariel on 22/12/2023.
//

import Network
import Models
import XCTest
@testable import Detail

@MainActor
@Observable class ListViewModelTests: XCTestCase {
    func testGetArtist() {
        let artistRepository = ArtistRepositoryMock()
        
        let viewModel = DetailViewModel(artwork: Artwork.placeholder(), artistRepository: artistRepository)
        
        // When
        let artistExpectation = XCTestExpectation(description: "Artist")
        withObservationTracking({
            _ = artistRepository.getArtistCount
        }, onChange: {
            artistExpectation.fulfill()
        })
        
        Task {
            await viewModel.fetchArtistDetails()
        }
        wait(for: [artistExpectation], timeout: 3.0)
        
        // Then
        XCTAssertEqual(artistRepository.getArtistCount, 1)
        XCTAssertEqual(viewModel.artist.id, 1)
        XCTAssertEqual(viewModel.artist.title, "Title")
        XCTAssertEqual(viewModel.artist.description, "Description")
    }
    
    func testGetArtworksWithServiceError() {
        let artistRepository = ArtistRepositoryMock()
        artistRepository.fail = true
        
        let viewModel = DetailViewModel(artwork: Artwork.placeholder(), artistRepository: artistRepository)
        
        // When
        let artistExpectation = XCTestExpectation(description: "Artist")
        withObservationTracking({
            _ = artistRepository.getArtistCount
        }, onChange: {
            artistExpectation.fulfill()
        })
        
        Task {
            await viewModel.fetchArtistDetails()
        }
        
        wait(for: [artistExpectation], timeout: 3.0)
        
        XCTAssertEqual(artistRepository.getArtistCount, 1)
        
        XCTAssertNotNil(viewModel.error)
        XCTAssertEqual(viewModel.error, "Throwing a test error")

    }
}
