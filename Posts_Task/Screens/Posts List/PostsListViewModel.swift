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
    private var networkManager: NetworkManagerProtocol
    private var cancellable: AnyCancellable?
    
    init(networkManager: NetworkManagerProtocol = NetworkManager.shared) {
        self.networkManager = networkManager
        getPosts()
    }
    
    private func getPosts(){
        cancellable = networkManager.loadPosts()
            .sink(receiveCompletion: { error in
                print(error)
            }, receiveValue: {[weak self] posts in
                self?.posts += posts
            })
    }
}


