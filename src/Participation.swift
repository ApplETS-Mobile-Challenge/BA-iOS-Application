//
//  Participation.swift
//  BA-iOS-Application
//
//  Created by Vincent Dupuis on 2016-02-13.
//  Copyright © 2016 Samuel Bellerose. All rights reserved.
//

import Foundation
import SwiftyJSON

class Participation {
    var id: Int
    var goodDeed: GoodDeed
    var status: Status
    var user: User
    
    init(json: JSON) {
        self.id = json["id"].intValue
        self.goodDeed = GoodDeed(json: json["goodDeed"])
        self.status = Status(rawValue: json["status"]["name"].string!)!
        self.user = User(json: json["user"])
    }
    
    init(id: Int, goodDeed: GoodDeed, status: Status, user: User) {
        self.id = id
        self.goodDeed = goodDeed
        self.status = status
        self.user = user
    }
}

