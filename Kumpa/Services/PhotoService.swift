//
//  PhotoService.swift
//  Kumpa
//
//  Created by MNC BANK 2 on 05/07/21.
//

import Foundation

struct PhotoService: APIHandler {
    
    func makeRequest(from param: [String: Any]) -> URLRequest? {
        let url =  APIList().photoURL
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = HTTPMethod.get.rawValue
        return urlRequest
        
    }
    
    func parseResponse(data: Data, response: HTTPURLResponse) throws -> [PhotoModel] {
        return try defaultParseResponse(data: data,response: response)
    }
}
