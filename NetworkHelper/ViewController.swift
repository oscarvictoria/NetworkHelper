//
//  ViewController.swift
//  NetworkHelper
//
//  Created by Oscar Victoria Gonzalez  on 12/6/19.
//  Copyright © 2019 Oscar Victoria Gonzalez . All rights reserved.
//

import UIKit

class ViewController: UIViewController {

@IBOutlet weak var ImageView: UIImageView!
    
    
let urlString = "https://images.mediotiempo.com/NNWNtO-1MBlNG0eHUwNFE0aXhbU=/958x596/uploads/media/2019/11/14/estadio-azteca-luce-espectacular-monday.jpg"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func loadImagePressed(_ sender: UIBarButtonItem) {
        NetworkHelper.shared.performDataTask(with: urlString) {(result) in
            switch result {
            case .failure(let appError):
                print("App error \(appError)")
            case .success(let data):
                let image = UIImage(data: data)
                DispatchQueue.main.async {
                    self.ImageView.image = image
                }
                
            }
        }
    }
    
  
    

}

