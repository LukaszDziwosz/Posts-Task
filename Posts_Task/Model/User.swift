//
//  User.swift
//  Posts_Task
//
//  Created by Lukasz Dziwosz on 30/09/2021.
//

import Foundation

struct User: Common, Codable {
    
    
    enum CodingKeys: String, CodingKey {
        case userId = "id"
        case name, username, email, address, phone, website, company
    }
    //var posts: [Post]
    let userId: Int
    let name: String
    let username: String
    let email: String
    let address: Address
    let phone: String
    let website: String
    let company:Company
}
struct Company: Codable {
    let name: String
    let catchPhrase: String
    let bs: String
}
struct Address: Codable {
    let street: String
    let suite: String
    let city: String
    let zipcode: String
    let geo: Geo
}
struct Geo: Codable {
    let lat: String
    let lng: String
}
