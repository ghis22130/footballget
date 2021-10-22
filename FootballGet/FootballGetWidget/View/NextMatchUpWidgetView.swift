//
//  NextMatchUpWidgetView.swift
//  FootballGet
//
//  Created by 지북 on 2021/10/19.
//

import SwiftUI

struct NextMatchUpWidgetView: View {
    
    let entry: NextMatchUpEntry
    
    var body: some View {
        VStack {
            HStack {
                
                VStack(alignment: .leading) {
                    Text(entry.selectedClubName)
                        .font(.system(size: 12))
                        .fontWeight(.bold)
                        .foregroundColor(Color(red: 0.84, green: 0.835, blue: 0.844))
                    
                    HStack {
                        Text("Rank")
                            .font(.system(size: 10))
                            .foregroundColor(Color(red: 0.84, green: 0.835, blue: 0.844))
                        
                        Text(entry.selectedClubrank)
                            .font(.system(size: 10))
                            .foregroundColor(Color(red: 0.84, green: 0.835, blue: 0.844))
                            .padding(.leading, -5)
                    }
                }.padding(.leading, 15)
                
                Spacer()
                
                Image(uiImage: entry.selectedClubLogo)
                    .resizable()
                    .frame(width: 25, height: 25, alignment: .center)
                    .padding(.trailing, 10)
                
            }
            
            Image(uiImage: entry.oppositeClubLogo)
                .resizable()
                .frame(width: 75, height: 75, alignment: .center)
                .padding(.top, -5)
            
            HStack {
                Text("vs")
                    .font(.system(size: 12))
                    .foregroundColor(Color(red: 0.84, green: 0.835, blue: 0.844))
                
                Text(entry.oppositeClubName)
                    .font(.system(size: 12))
                    .fontWeight(.bold)
                    .foregroundColor(Color(red: 0.84, green: 0.835, blue: 0.844))
                    .padding(.leading, -3)
            }.padding(.top, -5)
            
            Text(entry.gameDate.toString())
                .font(.system(size: 10))
                .fontWeight(.bold)
                .foregroundColor(Color(red: 0.84, green: 0.835, blue: 0.844))
        }
    }
}

struct NextMatchUpWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        NextMatchUpWidgetView(entry: .snapshot)
    }
}
