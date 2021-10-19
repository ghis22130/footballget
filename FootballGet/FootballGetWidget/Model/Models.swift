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
    let timestamp: Int
}

struct League: Decodable {
    let id: Int
    let name: String
    let country: String
    let logo: String
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
    init(selected identifier: String, fixture: Fixture, clubs: Clubs, league: League) {
        let (selected, opposite) = NextMathUpData.division(selected: identifier, clubs: clubs)
        
        self.selectedClubName = selected.name
        self.selectedClubrank = "1"
        self.selectedClubLogo = selected.logo
        self.oppositeClubName = opposite.name
        self.oppositeClubLogo = opposite.logo
        self.gameDate = fixture.date
    }
    
    static func division(selected identifier: String, clubs: Clubs) -> (Club, Club) {
        let home = clubs.home
        let away = clubs.away
        
        return String(home.id) == identifier ? (home, away) : (away, home)
    }
}

extension NextMathUpData {
    static let snapshot = NextMathUpData(selectedClubName: "Manchester United", selectedClubrank: "1", selectedClubLogo: "ManchesterUnitedLogo", oppositeClubName: "Chelsea", oppositeClubLogo: "ChelseaLogo", gameDate: Date())
}

