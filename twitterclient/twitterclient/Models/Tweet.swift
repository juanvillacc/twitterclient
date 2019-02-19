//
//  Tweet.swift
//  twitterclient
//
//  Created by JUAN VILLA CORREA on 17/02/19.
//  Copyright © 2019 personal. All rights reserved.
//

import Foundation

struct Tweet {
    let id: String
    let content: String
    let profileImageUrl: String?
    let userName: String
    let retweetsCount: String
    let elapsedTime: String
}
/*extension Tweet: Mappable {
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        id       <- map["id"]
        content     <- map["content"]
        profileImageUrl     <- map["profileImageUrl"]
        userName     <- map["userName"]
        retweetsCount    <- map["retweetsCount"]
        elapsedTime        <- map["elapsedTime"]
    }
}*/
