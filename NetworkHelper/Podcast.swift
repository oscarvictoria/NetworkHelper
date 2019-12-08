//
//  Podcast.swift
//  NetworkHelper
//
//  Created by Oscar Victoria Gonzalez  on 12/6/19.
//  Copyright © 2019 Oscar Victoria Gonzalez . All rights reserved.
//

import Foundation

struct AppleSearchAPI: Decodable {
    let results: [Podcast]
}

struct Podcast: Decodable {
    let artistName: String
    let collectionName: String
}
