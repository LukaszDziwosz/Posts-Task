//
//  Posts.swift
//  Posts_Task
//
//  Created by Lukasz Dziwosz on 30/09/2021.
//

import Foundation

struct Post: Codable, Equatable{
    var userId: Int
    let id: Int
    let title: String
    let body: String
}
