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
        /*let allFruitDetail = [[String: String]] //TODO FECHH THE DATA
        for item in allFruitDetail {
            fruitList.append(Tweet(attributes: item))
        }*/
        return tweetList
    }
}


