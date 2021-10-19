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
    
    let session: URLSession
    
    init(configuration: URLSessionConfiguration = .default) {
        self.session = URLSession(configuration: configuration)
    }

    func request(_ endpoint: NetworkRequest) -> AnyPublisher<Data,Error> {
        do {
            let request = try endpoint.request()
            return session.dataTaskPublisher(for: request)
                .receive(on: DispatchQueue.main)
                .dataMapError()
                .eraseToAnyPublisher()
        } catch let error {
            return Fail(error: error).eraseToAnyPublisher()
        }
    }
    
}


extension Publisher where Output == URLSession.DataTaskPublisher.Output {
    func dataMapError() -> AnyPublisher<Data, Error> {
        return tryMap {
            guard let code = ($0.response as? HTTPURLResponse)?.statusCode else {
                throw NetworkError.unexpectedResponse
            }
            guard (200..<300).contains(code) else {
                throw NetworkError.httpCode(code)
            }
            return $0.data
        }
        .receive(on: DispatchQueue.main)
        .eraseToAnyPublisher()
    }
}

