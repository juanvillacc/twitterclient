//
//  TweetAPIService.swift
//  twitterclient
//
//  Created by JUAN VILLA CORREA on 19/02/19.
//  Copyright © 2019 personal. All rights reserved.
//

import Foundation


class TweetsApiService {
    
    static func fetchTweets() -> [Tweet] {
            var  tweets: [Tweet] = [Tweet]()
        
            //mooking data
        
        tweets.append(Tweet(id: "text1", content: "", profileImageUrl: "", userName: "s1", retweetsCount: "", elapsedTime: ""))
        tweets.append(Tweet(id: "text2", content: "", profileImageUrl: "", userName: "s2", retweetsCount: "", elapsedTime: ""))
        
            /*let twitter = STTwitterAPI(oAuthConsumerKey: "fDresyX1537VjSoZ0htMLQ5rU",
                                       consumerSecret: "f4QyMF681uXHMY8uA7nz2DsXFR9zXncvr9Td8EyUzt5TccqigT",
                                       oauthToken: "364330374-N7fF23zrJzOLzsgvGIuxVE0B2FQCCxFhxVGqanp1",
                                       oauthTokenSecret: "LPw5B7pMct4xrgYF21HLGKAkEdOoE5U37zJkeE0e4vfP9");
            
            twitter?.verifyCredentials(userSuccessBlock: { (userName, userId) in
                twitter?.getHomeTimeline(sinceID: nil, count: 20,
                                         successBlock: { (statuses) in
                                            
                                            for status in statuses! {
                                                
                                               let data = (status as? NSDictionary)?["text"]
                                               tweets.append(Tweet(text: data, profileImageUrl: "", name: "", screenName: ""))
                                                
                                            }
                                            
                                            
                }, errorBlock: { (error) in
                    print(error)
                })
                
                
                
            }, errorBlock: { (error) in
                print(error)
            })*/
            return tweets
                
        
        }
    }

