//
//  ClubRankRequest.swift
//  FootballGet
//
//  Created by 지북 on 2021/10/20.
//

import Foundation

final class ClubRankRequest: NetworkRequest {
    
    var method: HTTPMethod
    
    var path: String
    
    var queryItems: [String : String]?
    
    var body: Data?

    
    init(league: String, club: String) {
        self.method = .get
        self.path = "standings"
        self.queryItems = ["season": "2021",
                           "league": league,
                           "team": club]
    }
    
}
