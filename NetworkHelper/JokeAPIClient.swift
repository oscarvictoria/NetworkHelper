//
//  JokeAPIClient.swift
//  NetworkHelper
//
//  Created by Oscar Victoria Gonzalez  on 12/6/19.
//  Copyright © 2019 Oscar Victoria Gonzalez . All rights reserved.
//

import Foundation

struct JokeAPIClient {
    
    
    static func getJokes(completion: @escaping (Result <[Joke], AppError>) -> ()) {
        let endpointURLString = "https://official-joke-api.appspot.com/jokes/programming/ten"
        var jokes = [Joke]()
        NetworkHelper.shared.performDataTask(with: endpointURLString ) { (result) in
            switch result {
            case .failure(let appError):
                print("app error \(appError)")
                break
            case .success(let data):
                do {
                     jokes = try JSONDecoder().decode([Joke].self, from: data)
                    let someJokes = jokes
                    completion(.success(someJokes))
                } catch {
                    print("decoding error \(error)")
                }
            }
        }
      
    }
}
