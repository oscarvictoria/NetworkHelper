//
//  NetworkHelper.swift
//  NetworkHelper
//
//  Created by Oscar Victoria Gonzalez  on 12/6/19.
//  Copyright © 2019 Oscar Victoria Gonzalez . All rights reserved.
//

import Foundation

// We need to make our NetworkHelper a singleton
// This means there will only ever be one instance of this class
// throughout the application, at no point will someone be able
// to create a new instance e.g NetworkHelper() will be a compiler error

class NetworkHelper {
    
    // We will create a shared instance of the NetworkHelper
    // This is the only place where the instance is created to be able to use everywhere
    static let shared = NetworkHelper()
    // We need to give it a value in the private init(), with a default value for configuration.
    private var session: URLSession
    // We will make the default inittializer private
    // required in order to be considered a singleton
    // also forbids anyone from creating an instance of NetworkHelper
    
    private init() {
        session = URLSession(configuration: .default)
    }
    
    func performDataTask(with urlString: String, completion: @escaping(Result<Data, AppError>) -> ()) {
        
        guard let url = URL(string: urlString) else {
            // handle bad url error case
            completion(.failure(.badURL(urlString)))
            return
        }
        
        // Two states on dataTask, resume() and suspended by default
        // suspended simply won't perform network request
        // this ultimately leads to debugging error and time lost if
        // you dont't explicitly resume() request
        let dataTask = session.dataTask(with: url) { (data, response, error) in
            
        }
        dataTask.resume()
        
    }
}
