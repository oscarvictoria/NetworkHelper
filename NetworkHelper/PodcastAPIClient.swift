//
//  PodcastAPIClient.swift
//  NetworkHelper
//
//  Created by Oscar Victoria Gonzalez  on 12/6/19.
//  Copyright © 2019 Oscar Victoria Gonzalez . All rights reserved.
//

import Foundation

struct PodcastAPIClient {
    
    // Completion handler needed for every function. 
    static func getPodcast(completion: @escaping(Result<[Podcast], AppError>) -> ()) {
        let endpointURLString = "https://itunes.apple.com/search?media=podcast&limit=200&term=swift"
        
        
        NetworkHelper.shared.performDataTask(with: endpointURLString) { (result) in
            switch result {
            case .failure(let appError):
                completion(.failure(.networkClientError(appError)))
            case .success(let data):
                do {
                    let searches = try JSONDecoder().decode(AppleSearchAPI.self, from: data)
                    let podcast = searches.results
                    completion(.success(podcast))
                } catch {
                    completion(.failure(.decodingError(error)))
                }
            }
        }
    }
}
