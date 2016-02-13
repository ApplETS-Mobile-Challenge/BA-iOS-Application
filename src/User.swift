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
    var description: String
    var participations: [GoodDeed] = []
    
    init(json: JSON) {
        self.username = json["username"].string!
        self.description = json["description"].string!
    }
}