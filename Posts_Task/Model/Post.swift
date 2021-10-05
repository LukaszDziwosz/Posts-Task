//
//  Posts.swift
//  Posts_Task
//
//  Created by Lukasz Dziwosz on 30/09/2021.
//

import Foundation

protocol Common {
    var userId: Int { get }
}

struct Post: Common, Codable, Equatable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}
