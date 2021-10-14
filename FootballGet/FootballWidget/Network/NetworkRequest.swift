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
    var path: String { get }
    var queryItems: [String: String]? { get }
    var headers: [String: String]? { get }
    var body: Data? { get }
    var url: URL? { get }
    
    func request() -> URLRequest?
}

extension NetworkRequest {
    
    var url: URL? {
        guard var components = URLComponents(string: path) { return nil }
        components.queryItems = queryItems.map({ URLQueryItem(name: $0.0, value: $0.1) })
        
        
    }
    
    func request() -> URLRequest? {
        guard let url = url else { return nil }
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        headers?.forEach({ request.setValue($1, forHTTPHeaderField: $0) })
        request.httpBody = body
        
        return request
    }
}

final class NextMatchUpRequest: NetworkRequest {
    var method: HTTPMethod
    
    var path: String
    
    var queryItems: [String : String]?
    
    var headers: [String : String]?
    
    var body: Data?
    
    var url: URL?
    
    init(_ teamId: Int) {
        self.method = .get
        self.path = "fixtures"
        self.queryItems = ["season": "2021", "team": "\(teamId)", "next": "1"]
    }
    
}