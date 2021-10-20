//
//  NextMatchUpTask.swift
//  FootballGet
//
//  Created by 지북 on 2021/10/18.
//

import Foundation

final class NextMatchUpTask: NetworkTask {

    typealias Input = NextMatchUpRequest
    
    typealias Output = NextMatchUpResponse
    
    let service: NetworkService
    
    init(_ service: NetworkService = DefaultNetworkService()) {
        self.service = service
    }
    
}

extension NextMatchUpTask {
    struct NextMatchUpResponse: Decodable {
        let response: [NextMatchUpResponseData]
    }
}

extension NextMatchUpTask.NextMatchUpResponse {
    struct NextMatchUpResponseData: Decodable {
        let fixture: Fixture
        let league: League
        let teams: Clubs
    }
}
