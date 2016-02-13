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
    var goodDeed: GoodDeed
    var status: Status
    
    init(json: JSON) {
        self.goodDeed = GoodDeed(json: json["goodDeed"])
        self.status = Status(rawValue: json["status"]["name"].string!)!
    }
}

enum Status: String {
    case Pending = "Pending"
    case Declined = "Declined"
    case OK = "OK"
}