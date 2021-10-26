//
//  ContentView.swift
//  FootballGet
//
//  Created by 지북 on 2021/10/19.
//

import SwiftUI
import Combine
import Kingfisher

var cancel = Set<AnyCancellable>()

struct ContentView: View {
    var body: some View {

        return Text("Hello, world!")
            .padding().onAppear {
                fetchNextMatchUp()
            }
    }
    
    private func fetchNextMatchUp() {
        
        print("131")
        
        let rankRequest = ClubRankRequest(league: "39", club: "33")
        
        let rankPublisher = ClubRankTask().perform(rankRequest)
        
        let nextMatchUpRequest = NextMatchUpRequest("33")
        
        print("-----NextMatchUp Receive Start--------\n")

        NextMatchUpTask().perform(nextMatchUpRequest).combineLatest(rankPublisher)
            .receive(on: DispatchQueue.main)
            .sink { result in
            switch result {
            case .failure(let error):
                print(error)
                return
            case .finished: return
            }
        } receiveValue: { (nextMatchUp, rank) in
            guard let nextMatchUpData = nextMatchUp.response.first,
                  let rank = rank.response.first?.league.standings?.first?.first?.rank else {
                      return
                  }
            print("-----NextMatchUp Receive End--------\n")
            print(nextMatchUp, rank)
            let imageDownloader = ImageDownloader()
            let fixture = nextMatchUpData.fixture
            let clubs = nextMatchUpData.teams
            let league = nextMatchUpData.league
            
            let homeLogo = imageDownloader.downloadWithPublisher(clubs.home.logo)
            
            var awayLogo = imageDownloader.downloadWithPublisher(clubs.away.logo)
            
            print("-----Logos Receive Start--------\n")

            homeLogo.combineLatest(awayLogo)
                .receive(on: DispatchQueue.main)
                .sink { home, away  in
                    print("-----Logos Receive End--------\n")

                    print(home, away)
                    let entry = NextMatchUpEntry(selected: "33", rank: rank, fixture: fixture, clubs: clubs, league: league, homeLogo: home, awayLogo: away)
                    print(entry)
                }.store(in: &cancel)
        }.store(in: &cancel)
    }
    
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
