//
//  BAViewController.swift
//  BA-iOS-Application
//
//  Created by Samuel Bellerose on 2016-02-12.
//  Copyright © 2016 Samuel Bellerose. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class BAViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet weak var baMapView: MKMapView!
    private var locationManager:CLLocationManager! = nil
    private var mapChangedFromUserInteraction = false
    private var shouldUpdateLocation = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        baMapView.showsUserLocation = true
        baMapView.delegate = self
        
        locationManager = CLLocationManager()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestAlwaysAuthorization()
            locationManager.startUpdatingLocation()
        }
        else {
            print("Location service disabled")
        }
        
    }
    
    private func mapViewRegionDidChangeFromUserInteraction() -> Bool {
        let view = baMapView.subviews[0]
        //  Look through gesture recognizers to determine whether this region change is from user interaction
        if let gestureRecognizers = view.gestureRecognizers {
            for recognizer in gestureRecognizers {
                if( recognizer.state == UIGestureRecognizerState.Began || recognizer.state == UIGestureRecognizerState.Ended ) {
                    return true
                }
            }
        }
        return false
    }
    
    func mapView(mapView: MKMapView, regionWillChangeAnimated animated: Bool) {
        mapChangedFromUserInteraction = mapViewRegionDidChangeFromUserInteraction()
        if (mapChangedFromUserInteraction) {
            shouldUpdateLocation = false
        }
    }
    
    func mapView(mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        if (mapChangedFromUserInteraction) {
            shouldUpdateLocation = false
        }
    }

    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if shouldUpdateLocation {
            let userLocation = CLLocation(latitude: (manager.location?.coordinate.latitude)! , longitude: (manager.location?.coordinate.longitude)!)
            centerMapOnLocation(userLocation)
        }
    }
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
            4000 * 2.0, 4000 * 2.0)
        baMapView.setRegion(coordinateRegion, animated: true)
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print(error.debugDescription)
    }
    
}