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
        NextMatchUpWidgetView(data: entry.nextMathUp)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("WidgetBackground"))
    }
}
