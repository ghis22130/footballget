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

class StepProvider {
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

class Step1: Stepable {
    var title: String = "Step 01"
    
    var description: String = "홈 화면에서 아무 앱 또는 빈 화면을 화면이 흔들릴 때 까지 약 1~2초간 길게 터치해줍니다. 화면이 흔들리면 핸드폰에서 좌측 상단의 + 버튼을 클릭해줍니다. "
    
    var imagePaths: [String] = ["step01_1", "step01_2"]
    
    var imageHeight: Int = 150
}

class Step2: Stepable {
    var title: String = "Step 02"
    
    var description: String = "위젯 검색에서 Football Get을 입력해줍니다. 그 후 Football Get을 선택해줍니다. Next Match Up으로 표시되는 위젯이 보여지게 되면 화면 하단에 보이는 위젯 추가를 눌러줍니다."
     
    var imagePaths: [String] = ["step02_1", "step02_2", "step02_3"]
    
    var imageHeight: Int = 600
    
}
class Step3: Stepable {
    var title: String = "Step 03"
    
    var description: String = "홈 화면에 위젯이 생성되면 위젯을 약 1~2초간 길게 터치해줍니다. 이때 아무 앱이나 화면을 꾹 눌러서 앱이 흔들리는 상태가 된 상태에서도 본 위젯을 눌러도 됩니다. 그런 다음 위젯 편집을 눌러 줍니다."
    
    var imagePaths: [String] = ["step03_1", "step03_2"]
    
    var imageHeight: Int = 350
    
}

class Step4: Stepable {
    var title: String = "Step 04"
    
    var description: String = "3가지의 항목을 설정을 완료해 주어야합니다. \n먼저 League부터 설정해줍니다. 현재 League는 5가지의 리그만 제공되고 있습니다. \nLeague를 선택하게되면 해당 League에 속해있는 Club들을 선택하실 수 있습니다. \n마지막으로 위젯의 디자인을 선택할 수 있는 Style입니다. 현재 default, two color, main color 3가지의 스타일이 제공되고 있습니다. 마음에 드는 스타일을 선택해주세요"
    
    var imagePaths: [String] = ["step04_1", "step04_2", "step04_3", "step04_4", "step04_5", "step04_6"]
    
    var imageHeight: Int = 600

}

class Step5: Stepable {
    var title: String = "Step 05"
    
    var description: String = "모든 셋팅이 완료되었습니다. 이제부터 원하는 팀의 다음 경기 정보를 위젯을 통해 볼 수 있습니다. 다양한 팀과 다양한 스타일로 나만의 위젯을 꾸며보세요."
    
    var imagePaths: [String] = ["step05_1"]
    
    var imageHeight: Int = 600
    
    
}
