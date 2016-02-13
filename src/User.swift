//
//  User.swift
//  BA-iOS-Application
//
//  Created by Vincent Dupuis on 2016-02-12.
//  Copyright © 2016 Samuel Bellerose. All rights reserved.
//

import Foundation
import SwiftyJSON

class User {
    var username: String
    var name: String
    var photo: String
    var rating: Int
    var description: String
    var participations: [Participation]
    var goodDeeds: [GoodDeed]
    
    init(json: JSON) {
        self.username = json["username"].string!
        self.name = json["name"].string!
        self.photo = json["photo"].string!
        self.rating = json["rating"].intValue
        self.description = json["description"].string!
        
        self.participations = []
        if let participations = json["participations"].array {
            for participation in participations {
                self.participations.append(Participation(json: participation))
            }
        }
        
        self.goodDeeds = []
        if let goodDeeds = json["good_deeds"].array {
            for goodDeed in goodDeeds {
                self.goodDeeds.append(GoodDeed(json: goodDeed))
            }
        }
    }
}