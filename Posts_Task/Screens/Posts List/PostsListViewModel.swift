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
    @Published var users = [User]()
    private var networkManager: NetworkManagerProtocol
    private var cancellable: AnyCancellable?
    
    init(networkManager: NetworkManagerProtocol = NetworkManager.shared) {
        self.networkManager = networkManager
        getPosts()
    }
    
    private func getPosts(){
        cancellable = networkManager.loadPosts()
            .mapError({ (error) -> Error in
                print(error.localizedDescription)
                          return error
                      })
            .sink(receiveCompletion: { _ in }
            , receiveValue: {[weak self] posts in
                print(posts)
                self?.posts = posts
                self?.getUsers()
            })
        
    }
    private func getUsers() {
       cancellable = $posts
            .flatMap { [unowned self] posts in
                Publishers.Sequence(sequence: posts.map { self.networkManager.loadUsers(for: $0.userId)})
                .flatMap { $0 }
                .collect()
            }
            .eraseToAnyPublisher()
            .mapError({ (error) -> Error in
                print(error.localizedDescription)
                          return error
                      })
            .sink { completion in
                print(completion)
            } receiveValue: { value in
                print(value)

            }

         
           
    }
    

}


