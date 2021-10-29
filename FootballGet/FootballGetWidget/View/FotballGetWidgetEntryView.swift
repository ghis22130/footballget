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
            return AnyView(NextMatchUpDefaultWidgetView(entry: entry))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.background)
        case .twoColor:
            return AnyView(NextMatchUpTwoColorWidgetView(entry: entry))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.background)
        case .mainColor:
            return AnyView(NextMatchUpMainColorWidgetView(entry: entry))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(entry.mainColor)
        default:
            return AnyView(NextMatchUpDefaultWidgetView(entry: entry))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.background)
        }
    }
}
