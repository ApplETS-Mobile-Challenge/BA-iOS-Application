//
//  PredictionRequest.swift
//  BA-iOS-Application
//
//  Created by Vincent Dupuis on 2016-02-13.
//  Copyright © 2016 Samuel Bellerose. All rights reserved.
//

import Foundation
import SwiftyJSON

class ParticipationRequest: BaseRequest {
    class var sharedInstance: ParticipationRequest {
        struct Singleton {
            static let instance = ParticipationRequest()
        }
        return Singleton.instance
    }
    
    func getParticipationByUser(userId: Int, callback: ([Participation]) -> Void) {
        self.get("participations/\(userId)", parameters: nil) { (data: JSON?) in
            var participations: [Participation] = []
            if let json = data {
                for (_,subJson):(String, JSON) in json {
                    participations.append(Participation(json: subJson))
                }
            }
            
            callback(participations)
        }
    }
}