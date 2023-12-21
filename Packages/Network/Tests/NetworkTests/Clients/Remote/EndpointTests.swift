//
//  EndpointTests.swift
//
//
//  Created by Ariel on 21/12/2023.
//

import XCTest
@testable import Network

final class EndpointTests: XCTestCase {
    
    func testURLWithPathAndAPIKey() {
        // Given
        let endpoint = Endpoint(path: "gallery")
        
        // When
        let url = endpoint.url
        
        // Then
        XCTAssertEqual(url.absoluteString, "https://api.artic.edu/api/v1/gallery")
    }
    
    func testURLWithPathAPIKeyAndQueryItem() {
        // Given
        let endpoint = Endpoint(path: "gallery/list", queryItems: [
            URLQueryItem(name: "page", value: "1")
        ])
        
        // When
        let url = endpoint.url
        
        // Then
        XCTAssertEqual(url.absoluteString, "https://api.artic.edu/api/v1/gallery/list?page=1")
    }
    
    func testURLWithMultiplePathComponentsAndQueryItems() {
        // Given
        let endpoint = Endpoint(path: "agent", queryItems: [
            URLQueryItem(name: "page", value: "1"),
            URLQueryItem(name: "fields", value: "title,birth_date")
        ])
        
        // When
        let url = endpoint.url
        
        // Then
        XCTAssertEqual(url.absoluteString, "https://api.artic.edu/api/v1/agent?page=1&fields=title,birth_date")
    }
    
}
