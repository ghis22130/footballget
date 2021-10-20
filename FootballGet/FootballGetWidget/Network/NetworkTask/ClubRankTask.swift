//
//  ClubRankTask.swift
//  FootballGet
//
//  Created by 지북 on 2021/10/20.
//

import Foundation

final class ClubRankTask: NetworkTask {
    
    typealias Input = ClubRankRequest
    
    typealias Output = ClubRankResponse
    
    let service: NetworkService

    init(_ service: NetworkService = DefaultNetworkService()) {
        self.service = service
    }
}

extension ClubRankTask {
    struct ClubRankResponse: Decodable {
        let response: [ClubRankResponseData]
    }
}

extension ClubRankTask.ClubRankResponse {
    struct ClubRankResponseData: Decodable {
        let league: League
    }
}
