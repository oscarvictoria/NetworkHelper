//
//  JokesViewController.swift
//  NetworkHelper
//
//  Created by Oscar Victoria Gonzalez  on 12/8/19.
//  Copyright © 2019 Oscar Victoria Gonzalez . All rights reserved.
//

import UIKit

class JokesViewController: UIViewController {
    
@IBOutlet weak var tableView: UITableView!
    
    var theJokes = [Joke]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
           
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        loadJokes()
    }
    
    func loadJokes() {
        JokeAPIClient.getJokes { [weak self] (result) in
            switch result {
            case .failure(let error):
                print("Error \(error)")
            case .success(let joke):
                self?.theJokes = joke
            }
        }
    }
  
    
    
    
}

extension JokesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return theJokes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "jokeCell", for: indexPath)
        let jokes = theJokes[indexPath.row]
        cell.textLabel?.text = jokes.setup
        return cell
    }
}
