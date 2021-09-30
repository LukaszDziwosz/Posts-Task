//
//  NetworkGeneric.swift
//  Posts_Task
//
//  Created by Lukasz Dziwosz on 30/09/2021.
//

import Foundation
import Combine

protocol NetworkGenericProtocol {
    func load<T: Decodable>(url: URL) -> AnyPublisher<T, Error>
}

struct NetworkGeneric: NetworkGenericProtocol {
    
    
    func load<T: Decodable>(url: URL) -> AnyPublisher<T, Error> {
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
