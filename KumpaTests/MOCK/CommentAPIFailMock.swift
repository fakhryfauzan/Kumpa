//
//  CommentAPIFailMock.swift
//  KumpaUITests
//
//  Created by MNC BANK 2 on 05/07/21.
//

import Foundation
@testable import Kumpa

class CommentAPIFailMock: APIHandler {
    
    func makeRequest(from param: [String: Any]) -> URLRequest? {
        let url =  APIList().commentURL
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = HTTPMethod.get.rawValue
        return urlRequest
        
    }
    
    func parseResponse(data: Data, response: HTTPURLResponse) throws -> [CommentModel] {
        guard let url = Bundle(for: CommentAPIFailMock.self).url(forResource: "comment_dummy_fail", withExtension: "json"), let data = try? Data(contentsOf: url) else {
            return [CommentModel]()
        }
        
        return try defaultParseResponse(data: data,response: response)
    }
}
