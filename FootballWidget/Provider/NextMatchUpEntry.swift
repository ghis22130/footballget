//
//  NextMatchUpEntry.swift
//  FootballGet
//
//  Created by 지북 on 2021/10/18.
//

import WidgetKit
import Foundation

struct NextMatchUpEntry: TimelineEntry {
    var date: Date = Date()
    let nextMathUp: NextMathUpData
}


extension NextMatchUpEntry {
    static let stub = NextMatchUpEntry(date: Date(), nextMathUp: NextMathUpData.stub)
}
