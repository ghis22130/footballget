//
//  FotballGetWidgetEntryView.swift
//  FootballGet
//
//  Created by 지북 on 2021/10/19.
//

import WidgetKit
import SwiftUI

struct FootballWidgetEntryView : View {
    var entry: NextMatchUpProvider.Entry

    var body: some View {
        NextMatchUpWidgetView(entry: entry)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("WidgetBackground"))
    }
}
