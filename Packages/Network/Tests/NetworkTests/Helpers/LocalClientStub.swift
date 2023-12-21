//
//  LocalClientStub.swift
//
//
//  Created by Ariel on 21/12/2023.
//

import Foundation
@testable import Network

class LocalClientStub: LocalClient {
    var storedData: [String: Any] = [:]
    
    func set<T>(value: T, forKey key: String) throws where T : Encodable {
        storedData[key] = value
    }
    
    func get<T>(forKey defaultName: String) throws -> T? {
        return storedData[defaultName] as? T
    }
    
    func remove(forKey defaultName: String) throws {
        storedData.removeValue(forKey: defaultName)
    }
}
