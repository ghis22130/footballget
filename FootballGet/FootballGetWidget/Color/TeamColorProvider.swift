//
//  TeamColorProvider.swift
//  FootballGet
//
//  Created by 지북 on 2021/10/27.
//

import Foundation

final class TeamColorProvidor {
    static var colorBook: [String: TeamColor] = [
        //Premier League
        "42": TeamColor(teamName: "Arsenal", mainColor: "#EF0107", secondColor: "#063672", teamNameColor: "#FFFFFF"),
        "66": TeamColor(teamName: "Aston Villa", mainColor: "#95BFE5", secondColor: "#670E36", teamNameColor: "#FFFFFF"),
        "51": TeamColor(teamName: "Brighton", mainColor: "#0057B8", secondColor: "#FFCD00", teamNameColor: "#FFFFFF"),
        "44": TeamColor(teamName: "Burnley", mainColor: "#6C1D45", secondColor: "#99D6EA", teamNameColor: "#F0B323"),
        "49": TeamColor(teamName: "Chelsea", mainColor: "#034694", secondColor: "#FFFFFF", teamNameColor: "#FFFFFF"),
        "52": TeamColor(teamName: "Crystal Palace", mainColor: "#1B458F", secondColor: "#C4122E", teamNameColor: "#FFFFFF"),
        "45": TeamColor(teamName: "Everton", mainColor: "#003399", secondColor: "#FFFFFF", teamNameColor: "#FFFFFF"),
        "46": TeamColor(teamName: "Leicester", mainColor: "#003090", secondColor: "#FDBE11", teamNameColor: "#FFFFFF"),
        "40": TeamColor(teamName: "Liverpool", mainColor: "#C8102E", secondColor: "#00B2A9", teamNameColor: "#F6EB61"),
        "50": TeamColor(teamName: "Manchester City", mainColor: "#6CABDD", secondColor: "#D4A12A", teamNameColor: "#1C2C5B"),
        "33": TeamColor(teamName: "Manchester United", mainColor: "#DA291C", secondColor: "#FBE122", teamNameColor: "#FBE122"),
        "34": TeamColor(teamName: "Newcastle", mainColor: "#241F20", secondColor: "#F1BE48", teamNameColor: "#FFFFFF"),
        "71": TeamColor(teamName: "Norwich", mainColor: "#00A650", secondColor: "#FFF200", teamNameColor: "#000000"),
        "41": TeamColor(teamName: "Southampton FC", mainColor: "#D71920", secondColor: "#FFC20E", teamNameColor: "#000000"),
        "47": TeamColor(teamName: "Tottenham", mainColor: "#132257", secondColor: "#FFFFFF", teamNameColor: "#FFFFFF"),
        "38": TeamColor(teamName: "Watford", mainColor: "#11210C", secondColor: "#FBEE23", teamNameColor: "#ED2127"),
        "48": TeamColor(teamName: "West Ham", mainColor: "#7A263A", secondColor: "#1BB1E7", teamNameColor: "#F3D459"),
        "39": TeamColor(teamName: "Wolves", mainColor: "#231F20", secondColor: "#FDB913", teamNameColor: "#FFFFFF"),
        "63": TeamColor(teamName: "Leeds", mainColor: "#1D428A", secondColor: "#FFCD00", teamNameColor: "#FFFFFF"),
        "55": TeamColor(teamName: "Brentford", mainColor: "#E30613", secondColor: "#FBB800", teamNameColor: "#FFFFFF")
        
        
        // LA LIGA
    ]
    
    
    static func teamColor(id: String) -> TeamColor? {
        return colorBook[id]
    }
}

struct TeamColor {
    let teamName: String
    let mainColor: String
    let secondColor: String
    let teamNameColor: String
}
