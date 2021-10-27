//
//  NextMatchUpTwoColorWidgetView.swift
//  FootballGet
//
//  Created by 지북 on 2021/10/27.
//

import SwiftUI

struct NextMatchUpTwoColorWidgetView: View {
    
    let entry: NextMatchUpEntry
    
    var teamNameColor: Color {
        guard let hex = entry.teamColor?.teamNameColor else {
            return Color.white
        }
        
        return Color(hex: hex)
    }
    
    var mainColor: Color {
        guard let hex = entry.teamColor?.mainColor else {
            return Color.clear
        }
        
        return Color(hex: hex)
    }
    
    var secondColor: Color {
        guard let hex = entry.teamColor?.secondColor else {
            return Color.clear
        }
        
        return Color(hex: hex)
    }
    
    init(entry: NextMatchUpEntry) {
        self.entry = entry
    }
    
    var body: some View {
        VStack {
            HStack {
                
                VStack(alignment: .leading) {
                    Text(entry.selectedClubName)
                        .font(.system(size: 12))
                        .fontWeight(.bold)
                        .foregroundColor(teamNameColor)
                    
                    HStack {
                        Text("Rank")
                            .font(.system(size: 10))
                            .foregroundColor(teamNameColor)
                        
                        Text(entry.selectedClubrank)
                            .font(.system(size: 10))
                            .foregroundColor(teamNameColor)
                            .padding(.leading, -5)
                    }.padding(.bottom, 3)
                }.padding(.leading, 15)
                
                Spacer()
                
                Image(uiImage: entry.selectedClubLogo)
                    .resizable()
                    .frame(width: 25, height: 25, alignment: .center)
                    .padding(.trailing, 10)
                
            }.background(mainColor)
                .padding(.top, 20)
                .background(mainColor)
                .padding(.bottom, 2)
                .background(secondColor)
                .padding(.top, -20)
            
            Image(uiImage: entry.oppositeClubLogo)
                .resizable()
                .frame(width: 70, height: 70, alignment: .center)
                
            
            HStack {
                Text("vs")
                    .font(.system(size: 12))
                    .foregroundColor(.white)

                Text(entry.oppositeClubName)
                    .font(.system(size: 12))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.leading, -3)
            }.padding(.top, -5)
            
            Text(entry.gameDate.toString())
                .font(.system(size: 10))
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
    }
}

struct NextMatchUpTwoColorWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NextMatchUpTwoColorWidgetView(entry: .snapshot).background(Color(.gray))
        }
    }
}
