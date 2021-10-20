//
//  ClubListRequest.swift
//  FootballGet
//
//  Created by 지북 on 2021/10/18.
//

import Foundation

final class ClubListRequest: NetworkRequest {
    var method: HTTPMethod
    
    var path: String
    
    var queryItems: [String : String]?
    
    var body: Data?
    
    init(_ leagueId: String) {
        self.method = .get
        self.path = "teams"
        self.queryItems = ["league" : leagueId, "season": "2021"]
    }
}

