//
//  GoodDeedRequest.swift
//  BA-iOS-Application
//
//  Created by Samuel Bellerose on 2016-02-13.
//  Copyright © 2016 Samuel Bellerose. All rights reserved.
//

import Foundation
import SwiftyJSON

class GoodDeedRequest: BaseRequest {
    
    class var sharedInstance: GoodDeedRequest {
        struct Singleton {
            static let instance = GoodDeedRequest()
        }
        return Singleton.instance
    }
    
    func getGoodDeeds(callback: (GoodDeed) -> Void) {
        self.get("gooddeeds-without-participation-ok", parameters: nil) { (json: JSON?) in
            if let data = json {
                if data["user"] != nil {
                    let user = User(json: data["user"])
//                    callback(user)
                } else {
//                    callback(nil)
                }
            }
        }
    }
}