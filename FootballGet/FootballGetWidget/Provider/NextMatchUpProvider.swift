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
    
    private func fetchNextMatchUp(for param : ClubParam?, completion: @escaping (Result<Entry?, Error>) -> ()) {
        guard let param = param, let id = param.identifier else { return }
        
        let request = NextMatchUpRequest(id)
        
        NextMatchUpTask().perform(request).sink { result in
            switch result {
            case .failure(let error): print(error)
            case .finished: return
            }
            
        } receiveValue: { data in
            guard let firstData = data.response.first else { return }
            let entry = NextMatchUpEntry(date: Date(), nextMathUp: NextMathUpData(selected: id,
                                                                                  fixture: firstData.fixture,
                                                                                  clubs: firstData.teams,
                                                                                  league: firstData.league))
            completion(.success(entry))
        }.store(in: &cancelBag)

    }
}
