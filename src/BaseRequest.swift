//
//  BaseRequest.swift
//  BA-iOS-Application
//
//  Created by Vincent Dupuis on 2016-02-12.
//  Copyright © 2016 Samuel Bellerose. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class BaseRequest {
    
    func get(path: String, parameters: [String: AnyObject]?, callback: (JSON?) -> Void) -> Void {
        
        Alamofire.request(.GET, Constants.api.baseURL + path, parameters: parameters)
            .response { request, response, data, error in
                print(request)
                print(response)
                print(error)
                debugPrint(NSString(data: data!, encoding: NSUTF8StringEncoding))
                callback(JSON(data: data!))
        }
    }
    
    func post(path: String, parameters: [String: AnyObject]?, callback: (JSON?) -> Void) -> Void {
        
        Alamofire.request(.POST, Constants.api.baseURL + path, parameters: parameters, encoding: .JSON)
            .response { request, response, data, error in
                print(request)
                print(response)
                print(error)
                debugPrint(NSString(data: data!, encoding: NSUTF8StringEncoding))
                callback(JSON(data: data!))
        }
    }
    
    func delete(path: String, parameters: [String: AnyObject]?, callback: (JSON?) -> Void) -> Void {
        
        Alamofire.request(.DELETE, Constants.api.baseURL + path, parameters: parameters, encoding: .JSON)
            .response { request, response, data, error in
                print(request)
                print(response)
                print(error)
                debugPrint(NSString(data: data!, encoding: NSUTF8StringEncoding))
                callback(JSON(data: data!))
        }
    }
}
