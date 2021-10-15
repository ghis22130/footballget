//
//  League.swift
//  FootballGet
//
//  Created by 지북 on 2021/10/15.
//

import Foundation

struct League: Decodable {
    let id: Int
    let name: String
    let country: String
    let logo: String
    let flag: String
    let season: Int
    let round: String
}
