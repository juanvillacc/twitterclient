//
//  TweetsInteractor.swift
//  twitterclient
//
//  Created by JUAN VILLA CORREA on 19/02/19.
//  Copyright © 2019 personal. All rights reserved.
//

import Foundation

class TweetListInteractor: TweetListInputInteractorProtocol {
    
    weak var presenter: TweetListOutputInteractorProtocol?
    
    func getTweetList() {
        presenter?.tweetListDidFetch(tweetList: getAllTweetDetail())
    }
    
    func getAllTweetDetail() -> [Tweet] {
        var tweetList = [Tweet]()
        //TODO FECHH THE DATA
        
        return tweetList
    }
}


