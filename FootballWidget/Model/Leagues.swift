//
//  Leagues.swift
//  FootballGet
//
//  Created by 지북 on 2021/10/18.
//

import Foundation

enum Leagues {
    case premierLeague
    case laliga
    case bundesliga
    case serieA
    case ligue1
}

extension Leagues {
    var id: Int {
        switch self {
        case .premierLeague: return 33
        case .ligue1: return 62
        case .bundesliga: return 78
        case .serieA: return 135
        case .laliga: return 140
        }
    }
    
    var description: String {
        switch self {
        case .premierLeague: return "Premier League"
        case .ligue1: return "LIGUE 1"
        case .bundesliga: return "BUNDESLIGA"
        case .serieA: return "SEREIA A"
        case .laliga: return "LA LIGA"
        }
    }
}
