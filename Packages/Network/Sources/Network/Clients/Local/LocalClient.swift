//
//  LocalClient.swift
//
//
//  Created by Ariel on 19/12/2023.
//

import Foundation

public protocol LocalClient {
    func get<T>(forKey key: String) throws -> T? where T: Codable
    func set<T: Encodable>(value: T, forKey key: String) throws
}

enum StorageObject {
    case artworks(page: Int)
    case artist(id: Int)
    
    var key: String {
        switch self {
        case .artworks(let page): return "artworks-\(page)"
        case .artist(let id): return "artist-\(id)"
        }
    }
}

public class DefaultLocalClient: LocalClient {
    public typealias SetMethod = (Any?, String) -> Void
    public typealias GetMethod = (String) -> Data?
    
    private let setValue: SetMethod
    private let getValue: GetMethod
    
    public init(set: @escaping SetMethod = UserDefaults.standard.set,
         get: @escaping GetMethod = UserDefaults.standard.data) {
        self.setValue = set
        self.getValue = get
    }
    
    public func set<T: Encodable>(value: T, forKey key: String) throws {
        let encodedData = try JSONEncoder().encode(value)
        setValue(encodedData, key)
    }
    
    public func get<T>(forKey key: String) throws -> T? where T : Decodable, T : Encodable {
        guard let encodedData = getValue(key) else { return nil }
        return try JSONDecoder().decode(T.self, from: encodedData)
    }
}
