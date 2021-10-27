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
        
        // Bundes Liga
        "157": TeamColor(teamName: "Bayern Munich", mainColor: "#C92C35", secondColor: "#2A64AC", teamNameColor: "#FFFFFF"),
        "159": TeamColor(teamName: "Hertha Berlin", mainColor: "#004D9E", secondColor: "#000000", teamNameColor: "#FFFFFF"),
        "160": TeamColor(teamName: "SC Freiburg", mainColor: "#000000", secondColor: "#FFFFFF", teamNameColor: "#FFFFFF"),
        "161": TeamColor(teamName: "VfL Wolfsburg", mainColor: "#65B32E", secondColor: "#52B5DF", teamNameColor: "#FFFFFF"),
        "163": TeamColor(teamName: "Borussia Monchengladbach", mainColor: "#000000", secondColor: "#FFFFFF", teamNameColor: "#FFFFFF"),
        "164": TeamColor(teamName: "FSV Mainz 05", mainColor: "#ED1C24", secondColor: "#FFFFFF", teamNameColor: "#FFFFFF"),
        "165": TeamColor(teamName: "Borussia Dortmund", mainColor: "#000000", secondColor: "#FDE100", teamNameColor: "#FDE100"),
        "167": TeamColor(teamName: "1899 Hoffenheim", mainColor: "#1C63B7", secondColor: "#FFFFFF", teamNameColor: "#FFFFFF"),
        "168": TeamColor(teamName: "Bayer Leverkusen", mainColor: "#E32221", secondColor: "#F3E500", teamNameColor: "#FFFFFF"),
        "169": TeamColor(teamName: "Eintracht Frankfurt", mainColor: "#E1000F", secondColor: "#FFFFFF", teamNameColor: "#FFFFFF"),
        "170": TeamColor(teamName: "FC Augsburg", mainColor: "#46714D", secondColor: "BA3733", teamNameColor: "#FFFFFF"),
        "172": TeamColor(teamName: "VfB Stuttgart", mainColor: "#E32219", secondColor: "#000000", teamNameColor: "#FFED00"),
        "173": TeamColor(teamName: "RB Leipzig", mainColor: "#DD0741", secondColor: "#F3E500", teamNameColor: "#FFFFFF"),
        "176": TeamColor(teamName: "VfL BOCHUM", mainColor: "#265BA4", secondColor: "#FFFFFF", teamNameColor: "#FFFFFF"),
        "178": TeamColor(teamName: "SpVgg Greuther Furth", mainColor: "#439741", secondColor: "#FFFFFF", teamNameColor: "#FFFFFF"),
        "182": TeamColor(teamName: "Union Berlin", mainColor: "#C23831", secondColor: "#F0EB64", teamNameColor: "#FFFFFF"),
        "188": TeamColor(teamName: "Arminia Bielefeld", mainColor: "#2755A0", secondColor: "#FFFFFF", teamNameColor: "#FFFFFF"),
        "192": TeamColor(teamName: "FC Koln", mainColor: "#DA3832", secondColor: "#000000", teamNameColor: "#FFFFFF"),
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
