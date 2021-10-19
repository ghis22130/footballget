//
//  ContentView.swift
//  FootballGet
//
//  Created by 지북 on 2021/10/19.
//

import SwiftUI
import Combine

var cancel: AnyCancellable?

struct ContentView: View {
    var body: some View {
        discript()
        return Text("Hello, world!")
            .padding()        
    }

    func discript() {
        let request = NextMatchUpRequest("33")
        cancel = NextMatchUpTask().perform(request).sink {result in
            switch result {
            case .failure(let error): print(error)
            case .finished: return
            }
        } receiveValue: { data in
            print(data.response.first?.teams.home)
        }
    }
    

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
