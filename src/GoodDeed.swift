//
//  GoodDeed.swift
//  BA-iOS-Application
//
//  Created by Vincent Dupuis on 2016-02-12.
//  Copyright © 2016 Samuel Bellerose. All rights reserved.
//

import Foundation
import SwiftyJSON
import MapKit
import CoreLocation

class GoodDeed: NSObject, MKAnnotation {
    
    var id: Int
    var title: String?
    var desc: String
    var address: String
    var startDate: NSDate
    var endDate: NSDate
    var creator: User
    var long: Double
    var lat: Double
    let locationName: String
    let coordinate: CLLocationCoordinate2D
    var distance: Double
    
    init(json: JSON) {
        self.id = json["id"].intValue
        self.title = json["title"].string!
        self.desc = json["description"].string!
        self.address = json["address"].string!
        self.startDate = DateHelper.instance.dateFromString(json["start_at"].string!)!
        self.endDate = DateHelper.instance.dateFromString(json["end_at"].string!)!
        self.creator = User(json: json["creator"])
        self.long = json["longitude"].doubleValue
        self.lat = json["latitude"].doubleValue
        self.coordinate = CLLocationCoordinate2D(latitude: self.lat, longitude: self.long)
        self.locationName = self.desc
        self.distance = 0
    }
    
    init(id: Int, title: String, description: String, address: String, startDate: NSDate, endDate: NSDate, creator: User, long: Double, lat: Double) {
        self.id = id
        self.title = title
        self.desc = description
        self.address = address
        self.startDate = startDate
        self.endDate = endDate
        self.creator = creator
        self.long = long
        self.lat = lat
        self.coordinate = CLLocationCoordinate2D(latitude: lat, longitude: long)
        self.locationName = self.desc
        self.distance = 0
    }
    
    var subtitle: String? {
        return locationName
    }
    
    func getDistanceFromUser(source:CLLocation) -> Double {
        let destination = CLLocation(latitude: lat, longitude: long)
        let distanceMeters = source.distanceFromLocation(destination)
        self.distance = (distanceMeters / 1000)
        return self.distance
    }
}
