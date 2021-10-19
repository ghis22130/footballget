//
//  NextMatchUpProvider.swift
//  FootballGet
//
//  Created by 지북 on 2021/10/19.
//

import Combine
import Foundation
import WidgetKit

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
        fetchNextMatchUp(for: configuration.Club) { result in
            switch result {
            case .success(let entry):
                guard let entry = entry else { return }
                let timeLine = Timeline(entries: [entry], policy: .after(Date().addingTimeInterval(60)))
                completion(timeLine)
            case .failure(_):
                let timeLine = Timeline(entries: [NextMatchUpEntry.snapshot], policy: .after(Date().addingTimeInterval(0 * 10)))
                completion(timeLine)
            }
        }
    }
    
    private func fetchNextMatchUp(for param : ClubParam?, completion: @escaping (Result<Entry?, Error>) -> ()){
    
    }
    
    private func distributeTeam(id: String, teams: Clubs) -> (Club, Club) {
        let id = Int(id) ?? -1
        
        return teams.home.id == id ? (teams.home, teams.away) : (teams.away, teams.home)
    }
}
