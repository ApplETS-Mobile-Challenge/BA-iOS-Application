//
//  GoodDeed.swift
//  BA-iOS-Application
//
//  Created by Vincent Dupuis on 2016-02-12.
//  Copyright © 2016 Samuel Bellerose. All rights reserved.
//

import Foundation
import SwiftyJSON

class GoodDeed {
    
    var id: Int
    var title: String
    var description: String
    var address: String
    var startDate: NSDate
    var endDate: NSDate
    var status: Status
    var creator: User
    
    init(json: JSON) {
        self.id = json["id"].intValue
        self.title = json["title"].string!
        self.description = json["description"].string!
        self.address = json["address"].string!
        self.startDate = DateHelper.instance.dateFromString(json["start_at"].string!)!
        self.endDate = DateHelper.instance.dateFromString(json["end_at"].string!)!
        self.status = Status(rawValue: json["status"]["name"].string!)!
        self.creator = User(json: json["creator"])
    }
    
    init(id: Int, title: String, description: String, address: String, startDate: NSDate, endDate: NSDate, status: Status, creator: User) {
        self.id = id
        self.title = title
        self.description = description
        self.address = address
        self.startDate = startDate
        self.endDate = endDate
        self.status = status
        self.creator = creator
    }
}