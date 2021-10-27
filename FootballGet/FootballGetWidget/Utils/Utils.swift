//
//  Utils.swift
//  FootballGet
//
//  Created by 지북 on 2021/10/19.
//

import SwiftUI

extension Date {
    func toString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd EEE a hh:mm"
        return formatter.string(from: self)
    }
}


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

}
