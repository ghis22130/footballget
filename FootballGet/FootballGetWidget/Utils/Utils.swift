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
