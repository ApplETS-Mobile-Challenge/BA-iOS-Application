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

class BAViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var baMapView: MKMapView!
    @IBOutlet weak var locationBtn: UIButton!
    @IBOutlet weak var listUIView: UIView!
    @IBOutlet weak var closeBtn: UIButton!
    var selectedGoodDeed: GoodDeed?
    
    private let annotationSegueIdentifier = "AnnotationModalSegueIdentifier"
    @IBOutlet weak var goodDeedTableView: UITableView!
    
    private var locationManager:CLLocationManager! = nil
    private var mapChangedFromUserInteraction = false
    private var shouldUpdateLocation = true
    private var listViewIsOpen = false
    private var listViewYOriginalPosition: CGFloat! = nil
    private var userLocation: CLLocation! = nil
    
    //Fictive GoodDeed to mock the map
    var goodDeedArray: [GoodDeed] = []
    var annotationArray: [Annotation] = []
    
    var firstGoodDeed: GoodDeed?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        closeBtn.hidden = true
        listViewYOriginalPosition = listUIView.frame.origin.y + 70 //Adding 70 for top layout guide
        
        //Handle touch on listView
        let tap = UITapGestureRecognizer(target: self, action: Selector("handleTap:"))
        listUIView.addGestureRecognizer(tap)
        
        //TableView
        goodDeedTableView.delegate = self
        goodDeedTableView.dataSource = self
        let tblView =  UIView(frame: CGRectZero)
        goodDeedTableView.tableFooterView = tblView
        goodDeedTableView?.tableFooterView!.hidden = true
        goodDeedTableView.backgroundColor = UIColor.clearColor()
        
        //Handle touch on close btn
        closeBtn.addTarget(self, action: Selector("closeListView"), forControlEvents: .TouchUpInside)
        
        //MapView
        baMapView.showsUserLocation = true
        baMapView.delegate = self
        
        locationBtn.addTarget(self, action: Selector("resetUpdateLocation"), forControlEvents: .TouchUpInside)
        
        //LocationManager
        locationManager = CLLocationManager()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestAlwaysAuthorization()
            locationManager.startUpdatingLocation()
            placeMarks()
        }
        else {
            print("Location service disabled")
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return goodDeedArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("GoodDeedCell", forIndexPath: indexPath) as! GoodDeedCell
        cell.goodDeedTitleLabel.text = goodDeedArray[indexPath.row].title
        cell.goodDeedDescriptionLabel.text = goodDeedArray[indexPath.row].desc
        cell.goodDeedImageView.image = UIImage(named: "vincent")
        if (self.userLocation != nil) {
            cell.goodDeedDistanceFromUserLabel.text = String(format:"%.2f", goodDeedArray[indexPath.row].getDistanceFromUser(self.userLocation)) + " km"
        }
        else {
            cell.goodDeedDistanceFromUserLabel.text = "-"
        }
        
        return cell
    }
    
    func placeMarks() {
        
        UserRequest.sharedInstance.getUser() { (user: User) in
            
            for oneGoodDeed in user.goodDeeds {
                
                let coordinates: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: oneGoodDeed.lat, longitude: oneGoodDeed.long)
                let annotation: Annotation! = Annotation.init(title: oneGoodDeed.title!, locationName: oneGoodDeed.description, discipline: oneGoodDeed.description, coordinate: coordinates)
                self.annotationArray.append(annotation)
                self.goodDeedArray.append(oneGoodDeed)
                print(oneGoodDeed.address)
                
            }
            
            //Maybe to be deleted
            self.goodDeedArray = user.goodDeeds
        }
        
        self.baMapView.addAnnotations(self.goodDeedArray)
        
//        GoodDeedRequest.sharedInstance.getGoodDeeds { (GoodDeed) -> Void in
//            print("test")
//        }
        
    }
    
    func handleTap(gestureRecognizer: UITapGestureRecognizer) {
        
        let xPosition = listUIView.frame.origin.x
        let yPosition = baMapView.frame.origin.y
        let height = listUIView.frame.size.height
        let width = listUIView.frame.size.width
        
        UIView.animateWithDuration(0.2, animations: {
            self.listUIView.frame = CGRectMake(xPosition, yPosition, width, height)
        })
        
        listViewIsOpen = true
        closeBtn.hidden = false
    }
    
    func closeListView() {
        let xPosition = listUIView.frame.origin.x
        let yPosition = listViewYOriginalPosition
        let height = listUIView.frame.size.height
        let width = listUIView.frame.size.width
        
        UIView.animateWithDuration(0.2, animations: {
            self.listUIView.frame = CGRectMake(xPosition, yPosition, width, height)
            
        })
        
        listViewIsOpen = false
        closeBtn.hidden = true
    }
    
    func resetUpdateLocation() {
        shouldUpdateLocation = true
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

    
    func mapView(mapView: MKMapView, didSelectAnnotationView view: MKAnnotationView) {
        let button = UIButton(type: .DetailDisclosure)
        button.frame = CGRectMake(0, 0, 23, 23)
        button.addTarget(self, action: "baDetailTapped:", forControlEvents: .TouchUpInside)
        view.rightCalloutAccessoryView = button
        if let a = view.annotation as? GoodDeed {
            let imgView = UIImageView()
            imgView.image = UIImage(named: a.creator.username)
            imgView.frame = CGRectMake(0, 0, 50, 50)
            view.leftCalloutAccessoryView = imgView
        }
        selectedGoodDeed = view.annotation as? GoodDeed
    }
    
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if shouldUpdateLocation {
            self.userLocation = CLLocation(latitude: (manager.location?.coordinate.latitude)! , longitude: (manager.location?.coordinate.longitude)!)
            centerMapOnLocation(userLocation)
            self.goodDeedTableView.reloadData()
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
    
    func baDetailTapped(sender: UIButton) {
        performSegueWithIdentifier(annotationSegueIdentifier, sender: sender)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let id = segue.identifier {
            if id == annotationSegueIdentifier {
                let nav = segue.destinationViewController as! UINavigationController
                let vc = nav.viewControllers.first as! BASubscriptionViewController
                vc.goodDeed = selectedGoodDeed
            }
        }
        super.prepareForSegue(segue, sender: sender)
    }
    
    func distanceBetweenUserAndGoodDeed(source:CLLocation,destination:CLLocation) -> Double {
        let distanceMeters = source.distanceFromLocation(destination)
        return (distanceMeters / 1000)
    }
    
    func generateRouteBetweenTwoCoordinates(from: CLLocationCoordinate2D, to: CLLocationCoordinate2D) {
        
    }
    
}