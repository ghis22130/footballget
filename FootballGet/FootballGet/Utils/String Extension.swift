//
//  String Extension.swift
//  FootballGet
//
//  Created by 지북 on 2021/10/29.
//

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    
    func localizedStringWithFormat(_ argument: CVarArg) -> String {
        return .localizedStringWithFormat(self.localized, argument)
    }
}
