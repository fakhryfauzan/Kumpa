//
//  UserModel.swift
//  Kumpa
//
//  Created by MNC BANK 2 on 04/07/21.
//

import Foundation

struct UserModel: Codable {
    var id: Int?
    var name: String?
    var username: String?
    var email: String?
    var address: Address?
    var phone: String?
    var website: String?
    var company: Company?
    var first3Albums: [AlbumModel]?
    var albums: [AlbumModel]?
}

struct Address: Codable {
    var street: String?
    var suite: String?
    var city: String?
    var zipcode: String?
    var geo: Geo?
}

struct Geo: Codable {
    var lat: String?
    var lng: String?
}

struct Company: Codable {
    var name: String?
    var catchPhrase: String?
    var bs: String?
}
