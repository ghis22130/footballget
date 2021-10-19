//
//  ClubListTask.swift
//  FootballGet
//
//  Created by 지북 on 2021/10/18.
//

import Foundation

final class ClubListTask: NetworkTask {
    
    typealias Input = ClubListRequest
    
    typealias Output = ClubListResponse
    
    var service: NetworkService
    
    init(_ service: NetworkService = DefaultNetworkService()) {
        self.service = service
    }
}

extension ClubListTask {
    struct ClubListResponse: Decodable {
        let response: [Int: Team]
    }
}
