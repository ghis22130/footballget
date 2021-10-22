//
//  FootballGetWidget.swift
//  FootballGetWidget
//
//  Created by 지북 on 2021/10/19.
//

import WidgetKit
import SwiftUI
import Combine
import Intents


var cancel: AnyCancellable?

struct FootballGetWidgetEntryView : View {
    var entry: NextMatchUpProvider.Entry

    var body: some View {
        NextMatchUpWidgetView(entry: entry)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("WidgetBackground"))
    }
}

@main
struct FootballGetWidget: Widget {
    let kind: String = "FootballGetWidget"

    var body: some WidgetConfiguration {
        
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: NextMatchUpProvider()) { entry in
            FootballGetWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
        
    }
}

struct FootballGetWidget_Previews: PreviewProvider {
    static var previews: some View {
        FootballGetWidgetEntryView(entry: NextMatchUpEntry.snapshot)
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
