//
//  ContentView.swift
//  Shared
//
//  Created by Matthew Garlington on 2/21/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var networkManager = NetworkManager()
    var body: some View {
        List {
            ForEach(networkManager.response?.data ?? [], id: \.self) { data in
                Text(data.name)
            }
        }
        .onAppear {
            networkManager.fetch()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
