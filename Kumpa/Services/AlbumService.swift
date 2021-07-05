//
//  AlbumService.swift
//  Kumpa
//
//  Created by MNC BANK 2 on 05/07/21.
//

import Foundation

struct AlbumService: APIHandler {
    
    func makeRequest(from param: [String: Any]) -> URLRequest? {
        let url =  APIList().albumURL
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = HTTPMethod.get.rawValue
        return urlRequest
        
    }
    
    func parseResponse(data: Data, response: HTTPURLResponse) throws -> [AlbumModel] {
        return try defaultParseResponse(data: data,response: response)
    }
}
