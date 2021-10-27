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
        "55": TeamColor(teamName: "Brentford", mainColor: "#E30613", secondColor: "#FBB800", teamNameColor: "#FFFFFF"),
        
        
        // LA LIGA
        "529": TeamColor(teamName: "Barcelona", mainColor: "#971D45", secondColor: "#1E4C93", teamNameColor: "#E5BD3F"),
        "530": TeamColor(teamName: "Atletico Madrid", mainColor: "#272E61", secondColor: "#CB3524", teamNameColor: "#FFFFFF"),
        "531": TeamColor(teamName: "Athletic Club", mainColor: "#EE2523", secondColor: "#FFFFFF", teamNameColor: "#000000"),
        "532": TeamColor(teamName: "Valencia", mainColor: "#E07338", secondColor: "#0097D7", teamNameColor: "#FFFFFF"),
        "533": TeamColor(teamName: "Villarreal", mainColor: "#005187", secondColor: "#E70005", teamNameColor: "#FFE667"),
        "536": TeamColor(teamName: "Sevilla", mainColor: "#F43333", secondColor: "#C79100", teamNameColor: "#FFFFFF"),
        "538": TeamColor(teamName: "Celta Vigo", mainColor: "#96C1EA", secondColor: "#D23B52", teamNameColor: "#FFFFFF"),
        "539": TeamColor(teamName: "Levante", mainColor: "#B4053F", secondColor: "#005CA5", teamNameColor: "#DCA43E"),
        "540": TeamColor(teamName: "Espanyol", mainColor: "#3669BA", secondColor: "#EA372D", teamNameColor: "#FFFFFF"),
        "541": TeamColor(teamName: "Real Madrid", mainColor: "#00529F", secondColor: "#FEBE10", teamNameColor: "#FFFFFF"),
        "542": TeamColor(teamName: "Alaves", mainColor: "#0761AF", secondColor: "#009AD7", teamNameColor: "#FFFFFF"),
        "543": TeamColor(teamName: "Real Betis", mainColor: "#0BB363", secondColor: "#E7A614", teamNameColor: "#FFFFFF"),
        "546": TeamColor(teamName: "Getafe", mainColor: "#005999", secondColor: "#C43A2F", teamNameColor: "#FFFFFF"),
        "548": TeamColor(teamName: "Real Sociedad", mainColor: "#0067B1", secondColor: "#D87722", teamNameColor: "#FFFFFF"),
        "715": TeamColor(teamName: "Granada CF", mainColor: "#A61B2B", secondColor: "#3734FF", teamNameColor: "#FFFFFF"),
        "724": TeamColor(teamName: "Cadiz", mainColor: "#3469B0", secondColor: "#FDF251", teamNameColor: "#FDF251"),
        "727": TeamColor(teamName: "Osasuna", mainColor: "#D91A21", secondColor: "#0A346F", teamNameColor: "#FFFFFF"),
        "728": TeamColor(teamName: "Rayo Vallecano", mainColor: "#D24235", secondColor: "#387765", teamNameColor: "#FFFFFF"),
        "798": TeamColor(teamName: "Mallorca", mainColor: "#DA3832", secondColor: "#3E8D5C", teamNameColor: "#EBD748"),
        "797": TeamColor(teamName: "Elche", mainColor: "#2B6232", secondColor: "#FFFB00", teamNameColor: "#FFFFFF"),
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
