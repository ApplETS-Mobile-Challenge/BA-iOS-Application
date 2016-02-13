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
    var id: Int
    var username: String
    var name: String
    var photo: String
    var rating: Double
    var description: String
    var participations: [Participation]
    var goodDeeds: [GoodDeed]
    
    init(json: JSON) {
        self.id = json["id"].intValue
        self.username = json["username"].string!
        self.name = json["name"].string!
        self.photo = json["photo"].string!
        self.rating = json["rating"].doubleValue
        self.description = json["description"].string!
        
        self.participations = []
        if let participations = json["participations"].array {
            for participation in participations {
                self.participations.append(Participation(json: participation))
            }
        }
        
        self.goodDeeds = []
        if let goodDeeds = json["good_deads"].array {
            for goodDeed in goodDeeds {
                self.goodDeeds.append(GoodDeed(json: goodDeed))
            }
        }
    }
    
    init(id: Int, username: String, name: String, photo: String, rating: Double, description: String, participations: [Participation], goodDeeds: [GoodDeed]) {
        self.id = id
        self.username = username
        self.name = name
        self.photo = photo
        self.rating = rating
        self.description = description
        self.participations = participations
        self.goodDeeds = goodDeeds
    }
}