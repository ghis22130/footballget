//
//  Color Extension.swift
//  FootballGet
//
//  Created by 지북 on 2021/10/28.
//

import SwiftUI

extension Color {

    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")
        
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        
        let r = Double((rgb >> 16) & 0xFF) / 255.0
        let g = Double((rgb >> 8) & 0xFF) / 255.0
        let b = Double((rgb >> 0) & 0xFF) / 255.0
        
        self.init(red: r, green: g, blue: b)
    }
    
    public static var background: Color {
        Color("Widgetbackground")
    }

}

extension String {
    var hexColor : Color {
        
        let scanner = Scanner(string: self)
        _ = scanner.scanString("#")
        
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        
        let r = Double((rgb >> 16) & 0xFF) / 255.0
        let g = Double((rgb >> 8) & 0xFF) / 255.0
        let b = Double((rgb >> 0) & 0xFF) / 255.0
        
        return Color(red: r, green: g, blue: b)
    }
}

extension NextMatchUpEntry {
    var mainColor: Color {
        return teamColor?.mainColor.hexColor ?? Color.background
    }
    
    var secondColor: Color {
        return teamColor?.secondColor.hexColor ?? Color.clear
    }
    
    var teamNameColor: Color {
        return teamColor?.teamNameColor.hexColor ?? Color.clear
    }
}
