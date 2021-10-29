//
//  TutorialStepViewModel.swift
//  FootballGet
//
//  Created by 지북 on 2021/10/28.
//

import Foundation
import Combine

class TutorialStepViewModel: ObservableObject, Identifiable {
    @Published var step: Stepable
    
    init(step: Int) {
        self.step = StepProvider.shared.step(id: step)
    }
}
