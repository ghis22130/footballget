//
//  Fixture.swift
//  FootballGet
//
//  Created by 지북 on 2021/10/15.
//

import Foundation

struct Fixture: Decodable {
    let id: Int
    let refefree: String?
    let timezone: String
    let date: Date
    let timestamp: String
}


