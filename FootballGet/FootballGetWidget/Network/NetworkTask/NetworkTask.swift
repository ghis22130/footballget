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
            .mapDecodingError(type: Output.self)
            .eraseToAnyPublisher()
    }
}

extension Publisher where Output == Data {
    func mapDecodingError<T: Decodable>(type: T.Type) -> AnyPublisher<T, Error> {
        
        return decode(type: T.self, decoder: JSONDecoder())
            .mapError { error in
                if let error = error as? DecodingError {
                    var errorToReport = error.localizedDescription
                    switch error {
                    case .dataCorrupted(let context):
                        let details = context.underlyingError?.localizedDescription ?? context.codingPath.map { $0.stringValue }.joined(separator: ".")
                        errorToReport = "\(context.debugDescription) - (\(details))"
                    case .keyNotFound(let key, let context):
                        let details = context.underlyingError?.localizedDescription ?? context.codingPath.map { $0.stringValue }.joined(separator: ".")
                        errorToReport = "\(context.debugDescription) (key: \(key), \(details))"
                    case .typeMismatch(let type, let context), .valueNotFound(let type, let context):
                        let details = context.underlyingError?.localizedDescription ?? context.codingPath.map { $0.stringValue }.joined(separator: ".")
                        errorToReport = "\(context.debugDescription) (type: \(type), \(details))"
                    @unknown default:
                        break
                    }
                    return NetworkError.decodingError(errorToReport)
                }  else {
                    return error
                }
            }
            .eraseToAnyPublisher()
    }
}
