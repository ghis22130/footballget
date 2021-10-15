//
//  Teams.swift
//  FootballGet
//
//  Created by 지북 on 2021/10/15.
//

import Foundation

struct Teams: Decodable {
    let home: Team
    let away: Team
}

struct Team: Decodable {
    let id: Int
    let name: String
    let logo: String
}
