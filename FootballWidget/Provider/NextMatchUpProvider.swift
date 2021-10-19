//
//  NextMatchUpProvider.swift
//  FootballGet
//
//  Created by 지북 on 2021/10/18.
//

import Combine
import Foundation
import WidgetKit

struct NextMatchUpProvider: IntentTimelineProvider {
        
    typealias Entry = NextMatchUpEntry
    
    typealias Intent = SelectTeamIntent
    
    func placeholder(in context: Context) -> NextMatchUpEntry {
        .stub
    }
    
    func getSnapshot(for configuration: SelectTeamIntent, in context: Context, completion: @escaping (NextMatchUpEntry) -> Void) {
        fetchNextMatchUp(for: configuration.Club) { result in
            switch result {
            case .success(let entry) :
                guard let entry = entry else { return }
                completion(entry)
            case .failure(_) :
                completion(.stub)
            }
        }
    }
    
    func getTimeline(for configuration: SelectTeamIntent, in context: Context, completion: @escaping (Timeline<NextMatchUpEntry>) -> Void) {
        fetchNextMatchUp(for: configuration.Club) { result in
            switch result {
            case .success(let entry):
                guard let entry = entry else { return }
                let timeLine = Timeline(entries: [entry], policy: .after(Date().addingTimeInterval(60 * 60 * 60)))
                completion(timeLine)
            case .failure(_):
                let timeLine = Timeline(entries: [NextMatchUpEntry.stub], policy: .after(Date().addingTimeInterval(0 * 10)))
                completion(timeLine)
            }
        }
    }
    
    private func fetchNextMatchUp(for param : ClubParam?, completion: @escaping (Result<Entry?, Error>) -> ()){
        guard let param = param else { return }
        
        let request = NextMatchUpRequest(Int(param.identifier ?? "" ) ?? -1 )
        _ = NextMatchUpTask().perform(request).sink { _ in
        } receiveValue: { data in
            let entry = data.response.values.map { data -> NextMatchUpEntry in
                let (owner, other) = distributeTeam(id: param.identifier ?? "", teams: data.teams)
                
                return NextMatchUpEntry(nextMathUp: NextMathUpData(owner: owner, other: other, date: Date()))
            }
            completion(.success(entry.first))
        }

    }
    
    private func distributeTeam(id: String, teams: Teams) -> (Team, Team) {
        let id = Int(id) ?? -1
        
        return teams.home.id == id ? (teams.home, teams.away) : (teams.away, teams.home)
    }
}
