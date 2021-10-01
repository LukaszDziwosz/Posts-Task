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
        cancellable = networkManager.loadUsersDetails()
            .mapError({ (error) -> Error in
                print(error.localizedDescription)
                          return error
                      })
            .sink(receiveCompletion: { _ in }
            , receiveValue: {[weak self] posts in
                print(posts)
//                self?.posts = posts
            })
    }
}


