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

@main
struct FootballGetWidget: Widget {
    let kind: String = "FootballGetWidget"

    var body: some WidgetConfiguration {
        
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: NextMatchUpProvider()) { entry in
            FootballGetWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Next Match Up")
        .description("Select the team you want to subscribe to.")
        .supportedFamilies([.systemSmall])
        
    }
}

struct FootballGetWidget_Previews: PreviewProvider {
    static var previews: some View {
        FootballGetWidgetEntryView(entry: NextMatchUpEntry.snapshot)
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
