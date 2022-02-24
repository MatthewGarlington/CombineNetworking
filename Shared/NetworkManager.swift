//
//  NetworkManager.swift
//  MarkCombineNetworking
//
//  Created by Matthew Garlington on 2/21/22.
//

import Combine
import Foundation


class NetworkManager: ObservableObject {
    @Published var response: Response?
    
    var cancellable: Set<AnyCancellable> = []
    
    func fetch() {
        let url = URL(string: "https://app.sportdataapi.com/api/v1/soccer/venues?apikey=599d1b80-0d6e-11ec-a549-9d6e6fe2c510&country_id=48")
        URLSession.shared.dataTaskPublisher(for: url!)
            .map { $0.data }
            .decode(type: Response?.self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .sink { [unowned self]  completion in
                if case .failure(let error) = completion {
                    print("There was an error, Error: \(error)")
                }
            } receiveValue: { [unowned self] data in
                response = data
            }
            .store(in: &cancellable)
    }
}
