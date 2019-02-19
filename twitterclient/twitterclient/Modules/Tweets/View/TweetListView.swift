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
        let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        tweetTblView = UITableView(frame: CGRect(x: 0, y: barHeight, width: displayWidth, height: displayHeight - barHeight))
        tweetTblView.register(UITableViewCell.self, forCellReuseIdentifier: "tweetCell")
        tweetTblView.dataSource = self
        tweetTblView.delegate = self
        self.view.addSubview(tweetTblView)
        
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
        
    }
    
}

