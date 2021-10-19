//
//  NextMatchUpData.swift
//  FootballGet
//
//  Created by 지북 on 2021/10/18.
//

import Foundation

struct NextMathUpData {
    let ownerClubName: String
    let rank: Int
    let ownerClubLogo: String
    let otherClubName: String
    let otherClubLogo: String
    let gameDate: Date
}

extension NextMathUpData {
    init(owner: Team, other: Team, date: Date) {
        self.init(ownerClubName: owner.name, rank: 1, ownerClubLogo: owner.logo, otherClubName: other.name, otherClubLogo: other.logo, gameDate: date)
    }
}
extension NextMathUpData {
    static let stub = NextMathUpData(ownerClubName: "Chelsea", rank: 1, ownerClubLogo: "ChelseaLogo", otherClubName: "Watford", otherClubLogo: "WatfordLogo", gameDate: Date())
}
