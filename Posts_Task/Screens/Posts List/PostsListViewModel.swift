//
//  PostListViewModel.swift
//  Posts_Task
//
//  Created by Lukasz Dziwosz on 30/09/2021.
//

import Foundation
import Combine

final class PostsListViewModel: ObservableObject {
    
    @Published var posts = [Post]()
    var networkGeneric: NetworkGenericProtocol
    
    init(networkGeneric: NetworkGenericProtocol = NetworkGeneric.shared) {
        self.networkGeneric = networkGeneric
        //loadPosts()
    }
    
    func loadPosts() -> AnyPublisher<[Post], Error> {
        networkGeneric.load(url: URL(string: "https://jsonplaceholder.typicode.com/posts")!)
    }
    
}
