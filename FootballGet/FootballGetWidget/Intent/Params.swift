//
//  Params.swift
//  FootballGet
//
//  Created by 지북 on 2021/10/19.
//

import Foundation

extension LeaguePram {
    var id: Int {
        switch self {
        case .premierLeague: return 39
        case .ligue1: return 62
        case .bundesliga: return 78
        case .serieA: return 135
        case .laliga: return 140
        default: return -1
        }
    }
    
    var description: String {
        switch self {
        case .premierLeague: return "Premier League"
        case .ligue1: return "LIGUE 1"
        case .bundesliga: return "BUNDESLIGA"
        case .serieA: return "SEREIA A"
        case .laliga: return "LA LIGA"
        default : return ""
        }
    }
}

extension ClubParam {
    convenience init(_ club: Club) {
        self.init(identifier: "\(club.id)", display: club.name)
        self.logo = club.logo
    }
}
