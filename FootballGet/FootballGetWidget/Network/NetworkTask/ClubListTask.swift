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
    
    let service: NetworkService
    
    init(_ service: NetworkService = DefaultNetworkService()) {
        self.service = service
    }
}

extension ClubListTask {
    struct ClubListResponse: Decodable {
        let response: [ClubListResponseData]
    }
}

extension ClubListTask.ClubListResponse {
    struct ClubListResponseData: Decodable {
        let club: Club
        
        enum CodingKeys: String, CodingKey {
            case club = "team"
        }
    }
}
