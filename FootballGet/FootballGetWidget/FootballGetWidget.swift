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
        NextMatchUpWidgetView(data: entry.nextMathUp)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("WidgetBackground"))
    }
}

@main
struct FootballGetWidget: Widget {
    let kind: String = "FootballGetWidget"

    var body: some WidgetConfiguration {
        description()
        
        return IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: NextMatchUpProvider()) { entry in
            FootballGetWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
        
    }
    
    func description() {
        print("123")
        let request = ClubListRequest(39)

        cancel = ClubListTask().perform(request).sink { result in
            switch result {
            case .failure(let error): print(error)
            case .finished:
                print("finished")
                return
            }
        } receiveValue: { data in
            let clubParmas = data.response.map { ClubParam($0.club) }
            clubParmas.forEach { print($0.displayString) }
        }
    }
}

struct FootballGetWidget_Previews: PreviewProvider {
    static var previews: some View {
        FootballGetWidgetEntryView(entry: NextMatchUpEntry(nextMathUp: .snapshot))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}

