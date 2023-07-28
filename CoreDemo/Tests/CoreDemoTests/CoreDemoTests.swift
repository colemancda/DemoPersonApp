import XCTest
@testable import CoreDemo

final class CoreDemoTests: XCTestCase {
    
    func testParse() throws {
        
        let jsonString = #"{"people":[{"name":"Russ","language":"swift"},{"name":"Wes","language":"dart"},{"name":"Tania","language":"kotlin"},{"name":"Robert","language":"kotlin"},{"name":"Leilah","language":"swift"},{"name":"Bastien","language":"swift"},{"name":"Alan","language":"swift"},{"name":"Lee","language":"swift"},{"name":"Margie"}]}"#
        
        let decoder = JSONDecoder()
        let response = try decoder.decode(PeopleResponse.self, from: Data(jsonString.utf8))
        
        XCTAssertEqual(response.people.count, 9)
    }
    
    func testRequest() async throws {
        
        let jsonString = #"{"people":[{"name":"Russ","language":"swift"},{"name":"Wes","language":"dart"},{"name":"Tania","language":"kotlin"},{"name":"Robert","language":"kotlin"},{"name":"Leilah","language":"swift"},{"name":"Bastien","language":"swift"},{"name":"Alan","language":"swift"},{"name":"Lee","language":"swift"},{"name":"Margie"}]}"#
        
        let url = URL(string: "https://gist.githubusercontent.com/russellbstephens/41e3b81879cf096212fc9834be0407b5/raw/388971ddd9fd1b099e829de233526eb345a1ad37/people.json")!
        
        let client = MockClient(
            data: Data(jsonString.utf8),
            response: HTTPURLResponse(
                url: url,
                statusCode: 200,
                httpVersion: nil,
                headerFields: nil
            )!
        )
        
        let response = try await client.fetchPeople()
        
        XCTAssertEqual(response.people.count, 9)
    }
}

struct MockClient: URLClient {
    
    let data: Data
    
    let response: URLResponse
    
    func response(for request: URLRequest) throws -> (Data, URLResponse) {
        guard request.url == request.url else {
            throw URLError(.badURL)
        }
        return (data, response)
    }
}
