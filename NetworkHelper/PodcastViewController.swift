//
//  PodcastViewController.swift
//  NetworkHelper
//
//  Created by Oscar Victoria Gonzalez  on 12/7/19.
//  Copyright © 2019 Oscar Victoria Gonzalez . All rights reserved.
//

import UIKit

class PodcastViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var podcast = [Podcast]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        loadPodcast()
    }
    
    
    
    func loadPodcast() {
        PodcastAPIClient.getPodcast { [weak self] (result) in
            switch result {
            case .failure(let appError):
                print("App error \(appError)")
            case .success(let podcast):
                self?.podcast = podcast
            }
        }
    }
    
    
}

extension PodcastViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return podcast.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "podcastCell", for: indexPath)
        let episode = podcast[indexPath.row]
        cell.textLabel?.text = episode.artistName
        cell.detailTextLabel?.text = episode.collectionName
        return cell
    }
}




