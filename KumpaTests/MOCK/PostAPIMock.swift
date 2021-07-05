

import Foundation
@testable import Kumpa

class PostAPIMock: APIHandler {
    
    func makeRequest(from param: [String: Any]) -> URLRequest? {
        let url =  APIList().postURL
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = HTTPMethod.get.rawValue
        return urlRequest
        
    }
    
    func parseResponse(data: Data, response: HTTPURLResponse) throws -> [PostModel] {
        guard let url = Bundle(for: PostAPIMock.self).url(forResource: "post_dummy", withExtension: "json"), let data = try? Data(contentsOf: url) else {
            return [PostModel]()
        }
        
        return try defaultParseResponse(data: data,response: response)
    }
}
