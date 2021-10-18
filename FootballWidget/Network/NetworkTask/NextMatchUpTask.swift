//
//  NextMatchUpTask.swift
//  FootballGet
//
//  Created by 지북 on 2021/10/18.
//

import Foundation

final class NextMatchUpTask: NetworkTask {

    typealias Input = NextMatchUpRequest
    
    typealias Output = NextMatchUpResponseData
    
    var service: NetworkService
    
    init(_ service: NetworkService) {
        self.service = service
    }
    
}

extension NextMatchUpTask {
    struct NextMatchUpResponseData: Decodable {
        let response: [Int: NextMatchUpResponse]
    }
}

extension NextMatchUpTask.NextMatchUpResponseData {
    struct NextMatchUpResponse: Decodable {
        let fixture: Fixture
        let league: League
        let teams: Teams
    }
}
