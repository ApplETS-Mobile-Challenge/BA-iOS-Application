//
//  UserRequest.swift
//  BA-iOS-Application
//
//  Created by Vincent Dupuis on 2016-02-12.
//  Copyright © 2016 Samuel Bellerose. All rights reserved.
//

import Foundation
import SwiftyJSON

class UserRequest: BaseRequest {
    
    class var sharedInstance: UserRequest {
        struct Singleton {
            static let instance = UserRequest()
        }
        return Singleton.instance
    }
    
    // Exemple pour faire les requêtes
//    func getUser(id: Int, callback: (User?) -> Void) {
//        self.get("users/\(id)", parameters: nil) { (json: JSON?) in
//            if let data = json {
//                if data["user"] != nil {
//                    let user = User(json: data["user"])
//                    callback(user)
//                } else {
//                    callback(nil)
//                }
//            }
//        }
//    }
}