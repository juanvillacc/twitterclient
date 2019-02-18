//
//  MainControllerExtension.swift
//  twitterclient
//
//  Created by JUAN VILLA CORREA on 17/02/19.
//  Copyright © 2019 personal. All rights reserved.
//

import Foundation
import UIKit
extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "tweetCellIdentifier", for: indexPath) as? TweetListTableViewCell else {
            fatalError("Cell not exists in storyboard")
        }
        
        let tweet = self.tweets[indexPath.row]
        
        //TODO fill the cell
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tweets.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150.0
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        
        self.selectedIndexPath = indexPath
        return indexPath
        
    }
    
}

class TweetListTableViewCell: UITableViewCell {
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descContainerHeightConstraint: NSLayoutConstraint!
}
