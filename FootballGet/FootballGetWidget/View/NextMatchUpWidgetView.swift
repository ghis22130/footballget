//
//  NextMatchUpWidgetView.swift
//  FootballGet
//
//  Created by 지북 on 2021/10/19.
//

import SwiftUI

struct NextMatchUpWidgetView: View {
    
    let data: NextMathUpData
    
    var body: some View {
        VStack {
            HStack {
                
                VStack(alignment: .leading) {
                    Text(data.selectedClubName)
                        .font(.system(size: 12))
                        .foregroundColor(Color(red: 0.84, green: 0.835, blue: 0.844))
                    
                    HStack {
                        Text("Rank")
                            .font(.system(size: 10))
                            .foregroundColor(Color(red: 0.84, green: 0.835, blue: 0.844))
                        
                        Text(data.selectedClubrank)
                            .font(.system(size: 10))
                            .foregroundColor(Color(red: 0.84, green: 0.835, blue: 0.844))
                            .padding(.leading, -5)
                    }
                }.padding(.leading, 15)
                
                Spacer()
                
                Image(data.selectedClubLogo)
                    .resizable()
                    .frame(width: 20, height: 20, alignment: .center)
                    .padding(.trailing, 15)
                
            }
            
            Image(data.oppositeClubLogo)
                .resizable()
                .frame(width: 80, height: 80, alignment: .center)
                .padding(.top, -5)
            
            HStack {
                Text("vs")
                    .font(.system(size: 12))
                    .foregroundColor(Color(red: 0.84, green: 0.835, blue: 0.844))
                
                Text(data.oppositeClubName)
                    .font(.system(size: 12))
                    .foregroundColor(Color(red: 0.84, green: 0.835, blue: 0.844))
            }.padding(.top, -5)
            Text(data.gameDate.toString())
                .font(.system(size: 12))
                .foregroundColor(Color(red: 0.84, green: 0.835, blue: 0.844))
        }
    }
}

struct NextMatchUpWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        NextMatchUpWidgetView(data: .snapshot)
    }
}
