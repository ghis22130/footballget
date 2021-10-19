//
//  FootballWidget.swift
//  FootballWidget
//
//  Created by 지북 on 2021/10/14.
//

import WidgetKit
import SwiftUI
import Intents

struct FootballWidgetEntryView : View {
    var entry: NextMatchUpProvider.Entry

    var body: some View {
        NextMatchUpWidgetView()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("WidgetBackground"))
    }
}

@main
struct FootballWidget: Widget {
    let kind: String = "FootballWidget"
    
    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: SelectTeamIntent.self, provider: NextMatchUpProvider()) { entry in
            FootballWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
    
    
}

struct FootballWidget_Previews: PreviewProvider {
    static var previews: some View {
        FootballWidgetEntryView(entry: NextMatchUpEntry(date: Date(), nextMathUp: NextMathUpData.stub))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
