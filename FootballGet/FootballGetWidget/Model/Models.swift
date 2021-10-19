//
//  Models.swift
//  FootballGet
//
//  Created by 지북 on 2021/10/19.
//

import Foundation

struct Fixture: Decodable {
    let id: Int
    let refefree: String?
    let timezone: String
    let date: Date
    let timestamp: String
}

struct League: Decodable {
    let id: Int
    let name: String
    let country: String
    let logo: String
    let flag: String
    let season: Int
    let round: String
}

struct Clubs: Decodable {
    let home: Club
    let away: Club
}

struct Club: Decodable {
    let id: Int
    let name: String
    let logo: String
}


//MARK: - Next MatchUp Data

struct NextMathUpData {
    let selectedClubName: String
    let selectedClubrank: String
    let selectedClubLogo: String
    let oppositeClubName: String
    let oppositeClubLogo: String
    let gameDate: Date
}

extension NextMathUpData {
    init(selected: Club, oppsite: Club, date: Date) {
        self.init(selectedClubName: selected.name, selectedClubrank: "1", selectedClubLogo: selected.logo, oppositeClubName: oppsite.name, oppositeClubLogo: oppsite.logo, gameDate: date)
    }
}
extension NextMathUpData {
    static let snapshot = NextMathUpData(selectedClubName: "Manchester United", selectedClubrank: "1", selectedClubLogo: "ManchesterUnitedLogo", oppositeClubName: "Chelsea", oppositeClubLogo: "ChelseaLogo", gameDate: Date())
}

