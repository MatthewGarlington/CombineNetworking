//
//  Model.swift
//  MarkCombineNetworking
//
//  Created by Matthew Garlington on 2/21/22.
//

import Foundation


struct Response: Decodable, Hashable {
    var data: [Data]
}

struct Data: Decodable, Hashable {
    var venue_id: Int
    var name: String 
}
