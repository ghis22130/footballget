//
//  NextMatchUpEntry.swift
//  FootballGet
//
//  Created by 지북 on 2021/10/19.
//

import WidgetKit
import UIKit

struct NextMatchUpEntry: TimelineEntry {
    var date: Date
    let selectedClubName: String
    let selectedClubrank: String
    let selectedClubLogo: UIImage
    let oppositeClubName: String
    let oppositeClubLogo: UIImage
    let gameDate: Date
    let teamColor: TeamColor?
    let style: StylePram
}

extension NextMatchUpEntry {
    init(selected identifier: String, rank: Int, fixture: Fixture, clubs: Clubs, league: League, homeLogo: UIImage, awayLogo: UIImage, style: StylePram) {
        let (selected, opposite) = NextMatchUpEntry.division(selected: identifier, clubs: clubs, homeLogo: homeLogo, awayLogo: awayLogo)
        
        self.date = Date()
        self.selectedClubName = selected.0.name
        self.selectedClubrank = "\(rank)"
        self.selectedClubLogo = selected.1
        self.oppositeClubName = opposite.0.name
        self.oppositeClubLogo = opposite.1
        self.gameDate = fixture.date
        self.teamColor = TeamColorProvidor.teamColor(id: identifier)
        self.style = style
    }
    
    static func division(selected identifier: String, clubs: Clubs, homeLogo: UIImage, awayLogo: UIImage) -> ((Club, UIImage), (Club, UIImage)) {
        let home = clubs.home
        let away = clubs.away
        
        return String(home.id) == identifier ? ((home, homeLogo), (away, awayLogo)) : ((away, awayLogo), (home, homeLogo))
    }
}


extension NextMatchUpEntry {
    static let snapshot = NextMatchUpEntry(date: Date(), selectedClubName: "Manchester United", selectedClubrank: "1", selectedClubLogo: NextMatchUpEntry.muLogo, oppositeClubName: "Chelsea", oppositeClubLogo: NextMatchUpEntry.chelseaLogo, gameDate: Date(), teamColor: TeamColorProvidor.teamColor(id: "33"), style: .defaultColor)
    
    static let muLogo = UIImage(named: "https://media.api-sports.io/football/teams/33.png") ?? UIImage()
    static let chelseaLogo = UIImage(named: "https://media.api-sports.io/football/teams/49.png") ?? UIImage()
}
