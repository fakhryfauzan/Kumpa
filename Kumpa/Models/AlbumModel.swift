//
//  AlbumModel.swift
//  Kumpa
//
//  Created by MNC BANK 2 on 05/07/21.
//

import Foundation

struct AlbumModel: Codable {
    var userId: Int?
    var id: Int?
    var title: String?
    var first3Photos: [PhotoModel]?
    var photos: [PhotoModel]?
}
