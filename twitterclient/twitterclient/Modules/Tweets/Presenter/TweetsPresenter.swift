//
//  TweetsPresenter.swift
//  twitterclient
//
//  Created by JUAN VILLA CORREA on 19/02/19.
//  Copyright © 2019 personal. All rights reserved.
//

import UIKit

class TweetListPresenter: TweetListPresenterProtocol {
    
    var wireframe: TweetListWireFrameProtocol?
    var view: TweetListViewProtocol?
    var interactor: TweetListInputInteractorProtocol?
    var presenter: TweetListPresenterProtocol?
    
    func showTweetSelection(with tweet: Tweet, from view: UIViewController) {
        wireframe?.pushToTweetDetail(with: tweet, from: view)
    }
    
    func viewDidLoad() {
        self.loadTweetList()
    }
    
    func loadTweetList() {
        interactor?.getTweetList()
    }
    
}

extension TweetListPresenter: TweetListOutputInteractorProtocol {
    
    func tweetListDidFetch(tweetList: [Tweet]) {
        view?.showTweets(with: tweetList)
    }
    
}

