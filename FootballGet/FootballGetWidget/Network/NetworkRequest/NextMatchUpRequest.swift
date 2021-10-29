//
//  NextMatchUpRequest.swift
//  FootballGet
//
//  Created by 지북 on 2021/10/18.
//

import Foundation

final class NextMatchUpRequest: NetworkRequest {

    var method: HTTPMethod
    
    var path: String
    
    var queryItems: [String : String]?
        
    var body: Data?
    
    init(_ teamId: String) {
        let timeZone = TimeZone.current.identifier
        
        self.method = .get
        self.path = "fixtures"
        self.queryItems = ["season": "2021",
                           "team": teamId,
                           "next": "1",
                           "timezone": timeZone]
    }
    
}

