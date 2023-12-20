//
//  Endpoint.swift
//
//
//  Created by Ariel on 19/12/2023.
//

import Foundation

import Foundation

struct Endpoint {
    var path: String
    var queryItems: [URLQueryItem] = []
}

extension Endpoint {
    var url: URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.artic.edu"
        components.path = "/api/v1/" + path
        components.queryItems?.append(contentsOf: queryItems)
        
        guard let url = components.url else {
            preconditionFailure("Invalid URL components: \(components)")
        }
        
        return url
    }
}
