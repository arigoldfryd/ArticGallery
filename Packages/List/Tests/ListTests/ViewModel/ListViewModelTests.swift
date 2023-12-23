//
//  ListViewModelTests.swift
//
//
//  Created by Ariel on 21/12/2023.
//

import Network
import XCTest
@testable import List

@MainActor
@Observable class ListViewModelTests: XCTestCase {
    
    func testGetArtworks() {
        let artworksRepository = ArtworksRepositoryMock()
        
        let viewModel = ListViewModel(artworks: [], artworksRepository: artworksRepository)
        
        // When
        let artworksExpectation = XCTestExpectation(description: "Artwork")
        withObservationTracking({
            _ = artworksRepository.getArtworksCounter
        }, onChange: {
            artworksExpectation.fulfill()
        })
        
        Task {
            await viewModel.fetchArtworks()
        }
        wait(for: [artworksExpectation], timeout: 3.0)
        
        XCTAssertEqual(artworksRepository.getArtworksCounter, 1)
         
        XCTAssertEqual(viewModel.artworks.count, 3)
        XCTAssertEqual(viewModel.artworks.first?.id, 1)
        XCTAssertEqual(viewModel.artworks.first?.title, "Title")
        XCTAssertEqual(viewModel.artworks.first?.artistId, 10)
        XCTAssertEqual(viewModel.artworks.first?.artistDisplay, "ArtistDisplay")
        XCTAssertEqual(viewModel.artworks.first?.imageURL, "https://www.artic.edu/iiif/2/11/full/843,/0/default.jpg")
        XCTAssertEqual(viewModel.artworks.first?.placeOfOrigin, "PlaceOfOrigin")
        XCTAssertEqual(viewModel.artworks.first?.mediumDisplay, "MediumDisplay")
    }
    
    func testGetArtworksExceedingTotalPages() {
        let artworksRepository = ArtworksRepositoryMock()
        
        let viewModel = ListViewModel(artworks: [], artworksRepository: artworksRepository)
        
        // When
        let artworksExpectation = XCTestExpectation(description: "Artwork")
        withObservationTracking({
            _ = artworksRepository.getArtworksCounter
        }, onChange: {
            artworksExpectation.fulfill()
        })
        
        Task {
            await viewModel.fetchArtworks()
            await viewModel.fetchArtworks()
            await viewModel.fetchArtworks()
            await viewModel.fetchArtworks()
        }
        wait(for: [artworksExpectation], timeout: 3.0)
        
        XCTAssertEqual(artworksRepository.getArtworksCounter, 3)
    }
    
    func testGetArtworksWithServiceError() {
        let artworksRepository = ArtworksRepositoryMock()
        artworksRepository.fail = true
        
        let viewModel = ListViewModel(artworks: [], artworksRepository: artworksRepository)
        
        // When
        let artworksExpectation = XCTestExpectation(description: "Artwork")
        withObservationTracking({
            _ = artworksRepository.getArtworksCounter
        }, onChange: {
            artworksExpectation.fulfill()
        })
        
        Task {
            await viewModel.fetchArtworks()
        }
        
        wait(for: [artworksExpectation], timeout: 3.0)
        
        XCTAssertEqual(artworksRepository.getArtworksCounter, 1)
        
        XCTAssertNotNil(viewModel.error)
        XCTAssertEqual(viewModel.error, "Throwing a test error")
    }
}
