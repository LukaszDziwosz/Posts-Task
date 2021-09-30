//
//  NetworkManager.swift
//  Posts_Task
//
//  Created by Lukasz Dziwosz on 30/09/2021.
//

import Foundation
import Combine

protocol NetworkManagerProtocol {
    func loadPosts() -> AnyPublisher<[Post], Error>
}

struct NetworkManager: NetworkManagerProtocol {
    
    static var networkGeneric = NetworkGeneric()
    
    static let shared: NetworkManagerProtocol = NetworkManager()
    
    
    func loadPosts() -> AnyPublisher<[Post], Error> {
        NetworkManager.networkGeneric.load(url: URL(string: "https://jsonplaceholder.typicode.com/posts")!)
    }
}
