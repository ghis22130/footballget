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
                let refreshDate = entry.gameDate // RefreshDate is time after Next Match
                let timeLine = Timeline(entries: [entry], policy: .after(refreshDate))
                completion(timeLine)
            case .failure(_):
                let refreshDate = Calendar.current.date(byAdding: .hour, value: 1, to: Date()) ?? Date() // if Data Load is fail, RefreshDate is 1 hour
                let timeLine = Timeline(entries: [NextMatchUpEntry.snapshot], policy: .after(refreshDate))
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
        } receiveValue: { [weak self] (nextMatchUp, rank) in
            guard let self = self,
                  let nextMatchUpData = nextMatchUp.response.first,
                  let rank = rank.response.first?.league.standings?.first?.first?.rank else {
                      completion(.failure(NetworkError.emptyData))
                      return
                  }
            
            let imageDownloader = ImageDownloader()
            let fixture = nextMatchUpData.fixture
            let clubs = nextMatchUpData.teams
            let league = nextMatchUpData.league
            
            var homeLogo: AnyPublisher<UIImage, Never>?
            imageDownloader.download(clubs.home.logo) { homeLogo = $0 }
            
            var awayLogo: AnyPublisher<UIImage, Never>?
            imageDownloader.download(clubs.away.logo) { awayLogo = $0 }
            
            guard let homeLogo = homeLogo, let awayLogo = awayLogo else { return }
            
            homeLogo.combineLatest(awayLogo)
                .receive(on: DispatchQueue.main)
                .sink { home, away  in
                    let entry = NextMatchUpEntry(selected: clubID, rank: rank, fixture: fixture, clubs: clubs, league: league, homeLogo: home, awayLogo: away)
                    completion(.success(entry))
                }.store(in: &self.cancelBag)
        }.store(in: &cancelBag)
    }
}


final class ImageDownloader {
    
    func download(_ url: String, completion: @escaping (AnyPublisher<UIImage, Never>)->()) {
        guard let url = URL(string: url) else { return }
        KingfisherManager.shared.retrieveImage(with: url) { result in
            switch result {
            case .success(let value):
                completion(Just(value.image as UIImage).eraseToAnyPublisher())
            case .failure(let error):
                print(error)
            }
        }
    }
}
