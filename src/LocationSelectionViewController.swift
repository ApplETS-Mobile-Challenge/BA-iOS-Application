//
//  LocationSelectionViewController.swift
//  BA-iOS-Application
//
//  Created by Maxime Mongeau on 2016-02-13.
//  Copyright © 2016 Samuel Bellerose. All rights reserved.
//

import UIKit
import MapKit
import Eureka

public class LocationSelectionViewController : UIViewController, TypedRowControllerType, MKMapViewDelegate, CLLocationManagerDelegate, UIGestureRecognizerDelegate {
    
    public var row: RowOf<CLLocation>!
    public var completionCallback : ((UIViewController) -> ())?
    public var locationManager: CLLocationManager!
    var annotation: Annotation? = nil
    
    lazy var mapView : MKMapView = { [unowned self] in
        let v = MKMapView(frame: self.view.bounds)
        v.autoresizingMask = UIViewAutoresizing.FlexibleWidth.union(UIViewAutoresizing.FlexibleHeight)
        return v
        }()
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nil, bundle: nil)
    }
    
    convenience public init(_ callback: (UIViewController) -> ()){
        self.init(nibName: nil, bundle: nil)
        completionCallback = callback
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(mapView)
        let longPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: "mapLongPress:")
        longPressGestureRecognizer.minimumPressDuration = 1
        mapView.addGestureRecognizer(longPressGestureRecognizer)
        mapView.delegate = self
        
        let button = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Done, target: self, action: "tappedDone:")
        button.title = "Done"
        navigationItem.rightBarButtonItem = button
        
        if let value = row.value {
            updateMapPosition(value.coordinate)
        }
        else{
            if (CLLocationManager.locationServicesEnabled()) {
                locationManager = CLLocationManager()
                locationManager.delegate = self
                locationManager.desiredAccuracy = kCLLocationAccuracyBest
                locationManager.requestAlwaysAuthorization()
                locationManager.startUpdatingLocation()
            }
        }
        updateTitle()
        
    }
    
    public func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        if !annotation.isKindOfClass(MKUserLocation) {
            let pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "AnnotationIdentifier")
            pinView.animatesDrop = true
            return pinView
        }
        return nil
    }
    
    func tappedDone(sender: UIBarButtonItem){
        completionCallback?(self)
    }
    
    func updateTitle(){
        let fmt = NSNumberFormatter()
        fmt.maximumFractionDigits = 4
        fmt.minimumFractionDigits = 4
        let latitude = fmt.stringFromNumber(mapView.centerCoordinate.latitude)!
        let longitude = fmt.stringFromNumber(mapView.centerCoordinate.longitude)!
        title = "\(latitude), \(longitude)"
    }
    
    public func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation: CLLocation = locations.last!
        row?.value = userLocation
        if let value = row.value {
            updateMapPosition(value.coordinate)
            mapView.showsUserLocation = true
        }
        manager.stopUpdatingLocation()
    }
    
    
    public func mapLongPress(recognizer: UIGestureRecognizer) {
        if recognizer.state == .Began {
            if let a = self.annotation {
                mapView.removeAnnotation(a)
            }
            let touchPoint = recognizer.locationInView(mapView)
            let coordinate = mapView.convertPoint(touchPoint, toCoordinateFromView: mapView)
            row?.value = CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)
            let annotation = Annotation(title: "", locationName: "", discipline: "", coordinate: coordinate)
            self.annotation = annotation
            mapView.addAnnotation(annotation)
            updateMapPosition(coordinate)
            updateTitle()
        }
    }
    
    public func updateMapPosition(coordinate: CLLocationCoordinate2D) {
        let region = MKCoordinateRegionMakeWithDistance(coordinate, 400, 400)
        mapView.setRegion(region, animated: true)
    }
}
