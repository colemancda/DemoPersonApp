//
//  Person.swift
//  DemoApp
//
//  Created by Alsey Coleman Miller on 7/28/23.
//

public struct Person: Equatable, Hashable, Codable {
    
    public let name: String
    
    public let language: Language?
}

extension Person: Identifiable {
    
    public var id: String {
        name
    }
}
