//
//  FotballGetWidgetEntryView.swift
//  FootballGet
//
//  Created by 지북 on 2021/10/19.
//

import WidgetKit
import SwiftUI

struct FootballGetWidgetEntryView : View {
    var entry: NextMatchUpProvider.Entry
    
    var body: some View {
        
        switch entry.style {
        case .defaultColor:
            return NextMatchUpDefaultWidgetView(entry: entry)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color("WidgetBackground"))
        case .twoColor:
            return NextMatchUpDefaultWidgetView(entry: entry)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color("WidgetBackground"))
        case .mainColor:
            let backgroundColor = entry.teamColor != nil ? Color(hex: entry.teamColor!.mainColor) : Color("WidgetBackground")
            return NextMatchUpDefaultWidgetView(entry: entry)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(backgroundColor)
        default:
            return NextMatchUpDefaultWidgetView(entry: entry)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color("WidgetBackground"))        }
    }
}
