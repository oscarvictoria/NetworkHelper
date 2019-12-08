//
//  Joke.swift
//  NetworkHelper
//
//  Created by Oscar Victoria Gonzalez  on 12/6/19.
//  Copyright © 2019 Oscar Victoria Gonzalez . All rights reserved.
//

import Foundation

// Encodable is encoding data to send to a web API
// Decodable is decoding JSON or other data from the web

// Together they are packages as an alias known as Codable

struct Joke: Decodable {
    let id: Int
    let type: String
    let setup: String
    let puncline: String
}
