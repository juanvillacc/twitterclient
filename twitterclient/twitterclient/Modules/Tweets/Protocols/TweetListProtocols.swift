//
//  TweetListProtocols.swift
//  twitterclient
//
//  Created by JUAN VILLA CORREA on 19/02/19.
//  Copyright © 2019 personal. All rights reserved.
//

import UIKit


protocol TweetListViewProtocol: class {
    // PRESENTER -> VIEW
    func showTweets(with tweets: [Tweet])
}

protocol TweetListPresenterProtocol: class {
    //View -> Presenter
    var interactor: TweetListInputInteractorProtocol? {get set}
    var view: TweetListViewProtocol? {get set}
    var wireframe: TweetListWireFrameProtocol? {get set}
    
    func viewDidLoad()
    func showTweetSelection(with tweet: Tweet, from view: UIViewController)
}

protocol TweetListInputInteractorProtocol: class {
    var presenter: TweetListOutputInteractorProtocol? {get set}
    //Presenter -> Interactor
    func getTweetList()
}

protocol TweetListOutputInteractorProtocol: class {
    //Interactor -> Presenter
    func tweetListDidFetch(tweetList: [Tweet])
}

protocol TweetListWireFrameProtocol: class {
    //Presenter -> Wireframe
    func pushToTweetDetail(with tweet: Tweet,from view: UIViewController)
    static func createTweetListModule(tweetListRef: TweetListView)
}
