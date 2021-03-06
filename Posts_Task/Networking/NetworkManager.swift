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
    func loadUser(for userId: Int) -> AnyPublisher<User,Error>
}

class NetworkManager: NetworkManagerProtocol {
    
    
 
    static let shared: NetworkManagerProtocol = NetworkManager()
    
    
    func loadPosts() -> AnyPublisher<[Post], Error> {
        load(url: URL(string: "https://jsonplaceholder.typicode.com/posts")!)
    }
    func loadPost(for id: Int) -> AnyPublisher<Post,Error> {
        load(url: URL(string: "https://jsonplaceholder.typicode.com/posts/\(id)")!)
    }
    func loadUser(for userId: Int) -> AnyPublisher<User, Error> {
        load(url: URL(string: "https://jsonplaceholder.typicode.com/users/\(userId)")!)
    }
    func loadUsers() -> AnyPublisher<[User], Error> {
        load(url: URL(string: "https://jsonplaceholder.typicode.com/users")!)
    }
   

   
    private func load<T: Decodable>(url: URL) -> AnyPublisher<T, Error> {
        return URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { result in
                guard let response = result.response as? HTTPURLResponse,
                      response.statusCode == 200 else {
                          throw URLError(.badServerResponse)
                      }
                return result.data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}

