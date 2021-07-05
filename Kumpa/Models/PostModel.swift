//
//  PostModel.swift
//  Kumpa
//
//  Created by MNC BANK 2 on 04/07/21.
//

import Foundation

struct PostModel: Codable {
    var userId: Int?
    var id: Int?
    var title: String?
    var body: String?
    var userName: String?
    var comments: [CommentModel]?
}
