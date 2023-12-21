//
//  HTTPClientMock.swift
//
//
//  Created by Ariel on 21/12/2023.
//

import Foundation
@testable import Network

class HTTPClientMock: HTTPClient {
    var responseData: Data?
    var responseError: Error?
    
    func perform<T>(request: URLRequest) async throws -> T where T: Decodable {
        if let error = responseError {
            throw error
        }
        
        guard let responseData = responseData else {
            fatalError("Response data not set for HTTPClientMock")
        }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return try decoder.decode(T.self, from: responseData)
    }
}
