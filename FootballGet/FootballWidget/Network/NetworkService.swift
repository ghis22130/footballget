//
//  NetworkService.swift
//  FootballGet
//
//  Created by 지북 on 2021/10/14.
//

import Foundation

protocol NetworkService {
    var session: URLSession { get }
}

final class DefaultNetworkService: NetworkService {
    var session: URLSession
    
    init(configuration: URLSessionConfiguration = .default) {
        self.session = URLSession(configuration: configuration)
    }
    
    
}
