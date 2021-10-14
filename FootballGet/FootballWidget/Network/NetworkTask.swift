//
//  NetworkTask.swift
//  FootballGet
//
//  Created by 지북 on 2021/10/14.
//

import Foundation
import Combine

protocol NetworkTask {
    associatedtype Input: NetworkRequest
    
    associatedtype Output: Decodable
    
    var service: NetworkService { get }
    
    func perform(_ request: Input) -> AnyPublisher<Output, Error>
}

extension NetworkTask {
    func perform(_ request: Input) -> AnyPublisher<Output, Error> {
        return service.request(request)
            .decode(type: Output.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.global())
            .eraseToAnyPublisher()
    }
}

final class NextMatchUpTask: NetworkTask {
    
    
    typealias Input = NextMatchUpRequest
    
    typealias Output = NextMatchUpResponseData
    
    struct NextMatchUpResponseData: Decodable {
        let response: Response
    }
    
}
