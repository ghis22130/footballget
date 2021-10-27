//
//  NextMatchUpWidgetView.swift
//  FootballGet
//
//  Created by 지북 on 2021/10/19.
//

import SwiftUI

struct NextMatchUpDefaultWidgetView: View {
    
    let entry: NextMatchUpEntry
    
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
                        .foregroundColor(.white)
                    
                    HStack {
                        Text("Rank")
                            .font(.system(size: 10))
                            .foregroundColor(.white)
                        
                        Text(entry.selectedClubrank)
                            .font(.system(size: 10))
                            .foregroundColor(.white)
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

struct NextMatchUpDefaultWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        NextMatchUpDefaultWidgetView(entry: .snapshot)
    }
}
