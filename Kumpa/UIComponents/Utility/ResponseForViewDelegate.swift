

import Foundation

@objc protocol ResponseForViewDelegate {
    func getResponse(response: Any?)
    @objc optional func getResponseError(response: Any?)
}
