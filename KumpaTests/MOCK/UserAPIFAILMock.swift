//
//  UserAPIFAILMock.swift
//  KumpaUITests
//
//  Created by MNC BANK 2 on 05/07/21.
//

import Foundation
@testable import Kumpa

class UserAPIFAILMock: APIHandler {
    
    func makeRequest(from param: [String: Any]) -> URLRequest? {
        let url =  APIList().userURL
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = HTTPMethod.get.rawValue
        return urlRequest
        
    }
    
    func parseResponse(data: Data, response: HTTPURLResponse) throws -> [UserModel] {
        guard let url = Bundle(for: UserAPIFAILMock.self).url(forResource: "user_dummy_fail", withExtension: "json"), let data = try? Data(contentsOf: url) else {
            return [UserModel]()
        }
        
        return try defaultParseResponse(data: data,response: response)
    }
}
