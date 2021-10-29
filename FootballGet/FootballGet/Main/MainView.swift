//
//  ContentView.swift
//  FootballGet
//
//  Created by 지북 on 2021/10/19.
//

import SwiftUI

struct MainView: View {
    let viewModels = (0..<StepProvider.shared.count()).map { $0 + 1 }.map { TutorialStepViewModel(step: $0) }
    
    var body: some View {
    
        ScrollView(.vertical) {
            
            HStack {
                Text("Football Get Tutorial")
                    .font(.title)
                    .fontWeight(.bold)
                
                Spacer()
            }.padding(.bottom, 10)
            
            VStack{
                ForEach(viewModels) {
                    TutorialStepView(viewModel: $0)
                }
            }
        }
        .padding([.leading, .trailing], 20)
        .padding(.top, UIScreen.main.focusedView?.safeAreaInsets.top)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
