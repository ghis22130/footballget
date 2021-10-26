//
//  ImageDataRequest.swift
//  FootballGet
//
//  Created by 지북 on 2021/10/21.
//

import Foundation

final class ImageDataRequest: NetworkRequest {
    
    var base: String
    
    var method: HTTPMethod
    
    var path: String
    
    var queryItems: [String : String]?
    
    var headers: [String : String]?
    
    var body: Data?
    
    init(url: String) {
        self.base = url
        self.method = .get
        self.path = ""
    }
}
