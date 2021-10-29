//
//  Step.swift
//  FootballGet
//
//  Created by 지북 on 2021/10/28.
//

import Foundation

protocol Stepable {
    var title: String { get set }
    var description: String { get set }
    var imagePaths: [String] { get set }
    var imageHeight: Int { get set }
}

final class StepProvider {
    public static let shared =  StepProvider()
    
    private init() { }
    
    private let steps: [Int: Stepable] = [1: Step1(),
                                          2: Step2(),
                                          3: Step3(),
                                          4: Step4(),
                                          5: Step5()]
    
    func step(id: Int) -> Stepable {
        steps[id]!
    }
    
    func count() -> Int {
        steps.count
    }
}

struct Step1: Stepable {
    var title: String = "Step 01"
    
    var description: String = "Touch any app or empty screen on the home screen for about 1 to 2 seconds until the screen shakes. If the screen shakes, click the + button on the upper left on the cell phone.".localized
    
    var imagePaths: [String] = ["step01_1", "step01_2"]
    
    var imageHeight: Int = 150
}

struct Step2: Stepable {
    var title: String = "Step 02"
    
    var description: String = "Enter Football Get in the widget search. After that, select Football Get. When you see a widget displayed as Next Match Up, tap Add Widget at the bottom of the screen.".localized
     
    var imagePaths: [String] = ["step02_1", "step02_2", "step02_3"]
    
    var imageHeight: Int = 600
    
}

struct Step3: Stepable {
    var title: String = "Step 03"
    
    var description: String = "When a widget is created on the home screen, touch the widget for about 1 to 2 seconds. At this time, you can press any app or screen to press this widget even when the app is shaking. Then, tap Edit Widget.".localized
    
    var imagePaths: [String] = ["step03_1", "step03_2"]
    
    var imageHeight: Int = 350
    
}

struct Step4: Stepable {
    var title: String = "Step 04"
    
    var description: String = "You need to complete the setting of three items.\nFirst, set up the league. Currently, only five leagues are provided in the League.\nIf you select a League, you can select clubs that belong to it.\nFinally, this is Style where you can choose the design of the widget. Currently, three styles are provided: default, two color, and main color. Please choose a style that you like.".localized
    
    var imagePaths: [String] = ["step04_1", "step04_2", "step04_3", "step04_4", "step04_5", "step04_6"]
    
    var imageHeight: Int = 600

}

struct Step5: Stepable {
    var title: String = "Step 05"
    
    var description: String = "All the settings have been completed. From now on, you can see the next game information of the team you want through the widget. Decorate your own widget with various teams and styles.".localized
    
    var imagePaths: [String] = ["step05_1"]
    
    var imageHeight: Int = 600
    
    
}
