//
//  NextMatchUpWidgetView.swift
//  FootballGet
//
//  Created by 지북 on 2021/10/15.
//

import SwiftUI

struct NextMatchUpWidgetView: View {
    var body: some View {
        VStack {
            HStack {
                Text("1")
                    .font(.system(size: 12))
                    .foregroundColor(Color(red: 0.84, green: 0.835, blue: 0.844))
                    .padding(.leading, 15)
                
                Text("Chelsea")
                    .font(.system(size: 12))
                    .foregroundColor(Color(red: 0.84, green: 0.835, blue: 0.844))
                    .padding(.leading, -5)
                
                Spacer()
                
                Image("ChelseaLogo")
                    .resizable()
                    .frame(width: 20, height: 20, alignment: .center)
                    .padding(.trailing, 15)
                
            }
            
            Image("WatfordLogo")
                .resizable()
                .frame(width: 80, height: 80, alignment: .center)
                .padding(.top, -5)
            
            HStack {
                Text("vs")
                    .font(.system(size: 12))
                    .foregroundColor(Color(red: 0.84, green: 0.835, blue: 0.844))
                
                Text("Watford")
                    .font(.system(size: 12))
                    .foregroundColor(Color(red: 0.84, green: 0.835, blue: 0.844))
            }.padding(.top, -5)
            Text("2021-10-16 SAT")
                .font(.system(size: 12))
                .foregroundColor(Color(red: 0.84, green: 0.835, blue: 0.844))
        }
    }
}

struct NextMatchUpWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        NextMatchUpWidgetView()
    }
}
