//
//  File.swift
//  
//
//  Created by Alsey Coleman Miller on 7/28/23.
//

import Foundation

public extension URLClient {
    
    func fetchPeople() async throws -> PeopleResponse {
        let url = URL(string: "https://gist.githubusercontent.com/russellbstephens/41e3b81879cf096212fc9834be0407b5/raw/388971ddd9fd1b099e829de233526eb345a1ad37/people.json")!
        let request = URLRequest(url: url)
        let (data, response) = try await self.response(for: request)
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200
            else { throw URLError(.unknown) }
        let decoder = JSONDecoder()
        return try decoder.decode(PeopleResponse.self, from: data)
    }
}
