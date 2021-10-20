//
//  NextMatchUpProvider.swift
//  FootballGet
//
//  Created by 지북 on 2021/10/19.
//

import Combine
import SwiftUI
import WidgetKit
import Kingfisher

final class NextMatchUpProvider: IntentTimelineProvider {
    
    typealias Entry = NextMatchUpEntry
    
    typealias Intent = ConfigurationIntent
    
    var cancelBag = Set<AnyCancellable>()
    
    func placeholder(in context: Context) -> NextMatchUpEntry {
        .snapshot
    }
    
    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (NextMatchUpEntry) -> Void) {
        completion(.snapshot)
    }
    
    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<NextMatchUpEntry>) -> Void) {
        fetchNextMatchUp(league: configuration.League, club: configuration.Club) { result in
            switch result {
            case .success(let entry):
                guard let entry = entry else { return }
                let timeLine = Timeline(entries: [entry], policy: .after(Date().addingTimeInterval(60 * 60)))
                completion(timeLine)
            case .failure(_):
                let timeLine = Timeline(entries: [NextMatchUpEntry.snapshot], policy: .after(Date().addingTimeInterval(1 * 10)))
                completion(timeLine)
            }
        }
    }
    
    private func fetchNextMatchUp(league: LeaguePram, club: ClubParam?, completion: @escaping (Result<Entry?, Error>) -> ()) {
        guard let club = club, let clubID = club.identifier else { return }
        
        let rankRequest = ClubRankRequest(league: league.id, club: clubID)
        let rankPublisher = ClubRankTask().perform(rankRequest)
        
        let nextMatchUpRequest = NextMatchUpRequest(clubID)
        
        NextMatchUpTask().perform(nextMatchUpRequest).combineLatest(rankPublisher).sink { result in
            switch result {
            case .failure(let error):
                completion(.failure(error))
                return
            case .finished: return
            }
        } receiveValue: { (nextMatchUp, rank) in
            guard let nextMatchUpData = nextMatchUp.response.first,
                  let rank = rank.response.first?.league.standings?.first?.first?.rank else {
                      completion(.failure(NetworkError.emptyData))
                      return
                  }
            
            let fixture = nextMatchUpData.fixture
            let clubs = nextMatchUpData.teams
            let league = nextMatchUpData.league
            
            let entry = NextMatchUpEntry(date: Date(), nextMathUp: NextMathUpData(selected: clubID, rank: rank, fixture: fixture, clubs: clubs, league: league))
            
            completion(.success(entry))
        }.store(in: &cancelBag)
    }
}
