

import Foundation


struct ServiceError : Error, Codable {
    let httpStatus : Int
    let message : String
}

extension ResponseHandler {
    func defaultParseResponse<T: Codable>(data: Data, response: HTTPURLResponse) throws -> T {
        let jsonEncoder = JSONDecoder()
        do {
            let body = try jsonEncoder.decode(T.self, from: data)
            if response.statusCode == 200 {
                return body
            } else {
                throw ServiceError(httpStatus: response.statusCode, message: "Unknown Error")
            }
        }catch {
            throw ServiceError(httpStatus: response.statusCode, message: error.localizedDescription.debugDescription + " " + error.localizedDescription)
        }
    }
}
