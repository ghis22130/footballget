//
//  Request.swift
//  FootballGet
//
//  Created by 지북 on 2021/10/14.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case push = "PUSH"
    case delete = "DELETE"
}

protocol NetworkRequest {
    var method: HTTPMethod { get }
    var base: String { get }
    var path: String { get }
    var queryItems: [String: String]? { get }
    var headers: [String: String]? { get }
    var body: Data? { get }
    var url: URL? { get }
    
    func request() throws -> URLRequest
}

extension NetworkRequest {
    
    var base: String {
        "https://api-football-v1.p.rapidapi.com/v3/"
    }
    
    var headers: [String: String]? {
        return ["x-rapidapi-host": "api-football-v1.p.rapidapi.com",
                "x-rapidapi-key": ""]
    }
    
    var url: URL? {
        guard var components = URLComponents(string: base + path) else { return nil }
        components.queryItems = queryItems?.map({ URLQueryItem(name: $0.0, value: $0.1) })
        
        return components.url
    }
    
    func request() throws -> URLRequest {
        guard let url = url else {
            throw NetworkError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = headers
        request.httpBody = body
        
        return request
    }
}

