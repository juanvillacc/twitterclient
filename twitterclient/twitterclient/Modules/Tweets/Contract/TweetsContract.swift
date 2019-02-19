//
//  TweetsContract.swift
//  twitterclient
//
//  Created by JUAN VILLA CORREA on 19/02/19.
//  Copyright © 2019 personal. All rights reserved.
//

/*import UIKit

protocol TweetsView: IndicatableView {
    var presenter: TweetsPresentation! { get set }
    
    func showNoContentScreen()
    func showTweetsData(_ tweets: [Tweet])
}

protocol ArticlesPresentation: class {
    weak var view: TweetsView? { get set }
    var interactor: TweetsUseCase! { get set }
    var router: TweetsWireframe! { get set }
    
    func viewDidLoad()
    func didClickSortButton()
    func didSelectArticle(_ tweet: Tweet)
}

protocol ArticlesUseCase: class {
    weak var output: TweetsInteractorOutput! { get set }
    
    func fetchArticles()
}

protocol TweetsInteractorOutput: class {
    func tweetsFetched(_ articles: [Tweet])
    func tweetsFetchFailed()
}

protocol TweetsWireframe: class {
    weak var viewController: UIViewController? { get set }
    
    func presentSortOptions(sortCompletion: (TweetSortType) -> ())?)
    func presentDetails(forArticle article: Tweet)
    
    static func assembleModule() -> UIViewController
}*/
