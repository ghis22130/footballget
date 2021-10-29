//
//  TutorialStepView.swift
//  FootballGet
//
//  Created by 지북 on 2021/10/28.
//

import SwiftUI
import Kingfisher

struct TutorialStepView: View {
    
    @ObservedObject var viewModel: TutorialStepViewModel
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            VStack(alignment: .leading) {
                Text(viewModel.step.title)
                    .fontWeight(.heavy)
                    .padding(.bottom, 5)
                Text(viewModel.step.description)
            }
            PageView(step: viewModel.step)
        }
    }
    
}


struct PageView: View {
    
    var step: Stepable
    
    var body: some View {
        TabView {
            ForEach(step.imagePaths, id: \.self) { path in
                ZStack {
                    Image(path)
                        .resizable()
                        .scaledToFit()
                    
                }.clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
            }
            .padding(.all, 10)
        }
        .frame(width: UIScreen.main.bounds.width * 0.8, height: CGFloat(step.imageHeight))
        .tabViewStyle(PageTabViewStyle())
    }
}
