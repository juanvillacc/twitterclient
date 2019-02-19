//
//  TweetTableViewCell.swift
//  twitterclient
//
//  Created by JUAN VILLA CORREA on 19/02/19.
//  Copyright © 2019 personal. All rights reserved.
//

import UIKit


class TweetTableViewCell: UITableViewCell {
    
    @IBOutlet weak var tweetImageView: UIImageView!
    @IBOutlet weak var tweetLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    func setup(_ tweet: Tweet) {
        authorLabel?.text = tweet.userName
        tweetLabel?.text = tweet.content
        //TODO load profile image
        /*        tweetImageView.kf.setImage(
            with: URL(string: tweet.profileImageUrl)
            placeholder: UIImage(named: "tweet image"),
            options: nil,
            progressBlock: nil,
            completionHandler: nil
        )*/
    }
}
