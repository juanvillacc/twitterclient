//
//  TweetsViewController.swift
//  twitterclient
//
//  Created by JUAN VILLA CORREA on 19/02/19.
//  Copyright © 2019 personal. All rights reserved.
//

import UIKit

class TweetListView: UIViewController,TweetListViewProtocol {
    
    @IBOutlet var tweetTblView: UITableView!
    
    var presenter:TweetListPresenterProtocol?
    var tweetList = [Tweet]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TweetListWireframe.createTweetListModule(tweetListRef: self)
        presenter?.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showTweets(with tweets: [Tweet]) {
        tweetList = tweets
        tweetTblView.reloadData()
    }
    
}

extension TweetListView: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tweetTblView.dequeueReusableCell(withIdentifier: "tweetCell", for: indexPath)
        let tweet = tweetList[indexPath.row]
        cell.textLabel?.text = tweet.userName
        cell.detailTextLabel?.text = tweet.content
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tweetList.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.showTweetSelection(with: tweetList[indexPath.row], from: self)
    }
    
}

