
import Foundation

struct APIList {
    let baseURL = "https://jsonplaceholder.typicode.com/"
    var postURL: URL {
        return URL(string: baseURL + "posts")!
    }
    var commentURL: URL {
        return URL(string: baseURL + "comments")!
    }
    var userURL: URL {
        return URL(string: baseURL + "users")!
    }
    var photoURL: URL {
        return URL(string: baseURL + "photos")!
    }
    var albumURL: URL {
        return URL(string: baseURL + "albums")!
    }
}
