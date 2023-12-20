//
//  HTTPClient.swift
//
//
//  Created by Ariel on 19/12/2023.
//

import Foundation

public protocol HTTPClient {
    func perform<T>(request: URLRequest) async throws -> T where T: Decodable
}

public class DefaultHTTPClient: HTTPClient {
    public typealias PerformRequest = (URLRequest) async throws -> (Data, URLResponse)
    
    private let perform: PerformRequest
    
    public init(perform: @escaping PerformRequest = URLSession.cached.data) {
        self.perform = perform
    }
    
    public func perform<T>(request: URLRequest) async throws -> T where T: Decodable {
        let (data, _) = try await perform(request)
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .iso8601
        
        return try decoder.decode(T.self, from: data)
    }
}

public extension URLSession {
    public static var cached: URLSession {
        let configuration = URLSessionConfiguration.default
        configuration.urlCache = URLCache.shared
        configuration.requestCachePolicy = .returnCacheDataElseLoad

        return URLSession(configuration: configuration)
    }
}
