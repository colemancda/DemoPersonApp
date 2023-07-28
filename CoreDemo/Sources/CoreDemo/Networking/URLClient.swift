//
//  URLClient.swift
//  
//
//  Created by Alsey Coleman Miller on 7/28/23.
//

import Foundation

public protocol URLClient {
    
    func response(for request: URLRequest) async throws -> (Data, URLResponse)
}

extension URLSession: URLClient {
    
    public func response(for request: URLRequest) async throws -> (Data, URLResponse) {
        return try await self.data(for: request, delegate: nil)
    }
}
