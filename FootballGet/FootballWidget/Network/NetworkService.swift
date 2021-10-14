//
//  NetworkService.swift
//  FootballGet
//
//  Created by 지북 on 2021/10/14.
//

import Combine
import Foundation

protocol NetworkService {
    var session: URLSession { get }
    
    func request(_ request: NetworkRequest) -> AnyPublisher<Data,Error>
}

final class DefaultNetworkService: NetworkService {
    
    var session: URLSession
    
    init(configuration: URLSessionConfiguration = .default) {
        self.session = URLSession(configuration: configuration)
    }

    func request(_ endpoint: NetworkRequest) -> AnyPublisher<Data,Error> {
        do {
            let request = try endpoint.request()
            return session.dataTaskPublisher(for: request)
                .receive(on: DispatchQueue.global())
                .map { $0.data }
                .mapError { _ in NetworkError.unexpectedResponse }
                .eraseToAnyPublisher()
        } catch {
            return Fail(error: NetworkError.badRequest)
                .eraseToAnyPublisher()
        }
    }
    
}

