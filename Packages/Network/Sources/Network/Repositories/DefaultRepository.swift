//
//  DefaultRepository.swift
//
//
//  Created by Ariel on 22/12/2023.
//

import Foundation

public class DefaultRepository {
    let httpClient: HTTPClient
    let localClient: LocalClient
    
    public init(httpClient: HTTPClient = DefaultHTTPClient(),
                localClient: LocalClient = DefaultLocalClient()) {
        self.httpClient = httpClient
        self.localClient = localClient
    }
    
    func execute<Response: Codable>(request: URLRequest, object: StorageObject) async throws -> Response {
        let key = object.key
        
        if let response: Response = try localClient.get(forKey: key) {
            return response
        }
        
        let response: Response = try await httpClient.perform(request: request)
        
        try localClient.set(value: response, forKey: key)
        return response
    }
}
