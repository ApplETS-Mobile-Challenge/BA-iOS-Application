//
//  GoodDeedRequest.swift
//  BA-iOS-Application
//
//  Created by Samuel Bellerose on 2016-02-13.
//  Copyright © 2016 Samuel Bellerose. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

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
    
    func postSubscription(goodDeedId: Int, userId: Int, callback: (Bool)->()) {
        Alamofire.request(.POST, Constants.api.baseURL + "/participations", parameters: ["good-deed-id": goodDeedId, "user-id": userId], encoding: .JSON).response { request, response, data, error in
            if error == nil {
                callback(true)
            } else {
                callback(false)
            }
            
        }
    }
}