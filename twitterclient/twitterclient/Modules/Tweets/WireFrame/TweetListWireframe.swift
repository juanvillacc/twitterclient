//
//  TweetListWireframe.swift
//  twitterclient
//
//  Created by JUAN VILLA CORREA on 19/02/19.
//  Copyright © 2019 personal. All rights reserved.
//

import UIKit

class TweetListWireframe: TweetListWireFrameProtocol {
    
    class func createTweetListModule(tweetListRef: TweetListView) {
        let presenter: TweetListPresenterProtocol & TweetListOutputInteractorProtocol = TweetListPresenter()
        
        tweetListRef.presenter = presenter
        tweetListRef.presenter?.wireframe = TweetListWireframe()
        tweetListRef.presenter?.view = tweetListRef
        tweetListRef.presenter?.interactor = TweetListInteractor()
        tweetListRef.presenter?.interactor?.presenter = presenter
    }
    
}
