//
//  Tweet.swift
//  twitterclient
//
//  Created by JUAN VILLA CORREA on 17/02/19.
//  Copyright © 2019 personal. All rights reserved.
//

import Foundation

struct Tweet: Codable {
    let id: Int
    let content: String
    let profileIcon: String?
    let userName: String
    let retweetsCount: String
    let elapsedTime: String
}
