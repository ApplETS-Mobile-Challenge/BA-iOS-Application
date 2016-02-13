//
//  DateHelper.swift
//  BA-iOS-Application
//
//  Created by Vincent Dupuis on 2016-02-13.
//  Copyright © 2016 Samuel Bellerose. All rights reserved.
//

import Foundation

class DateHelper {
    class var instance: NSDateFormatter {
        struct Singleton {
            static let instance = NSDateFormatter()
        }
        Singleton.instance.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return Singleton.instance
    }
}