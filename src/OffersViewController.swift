//
//  OffersViewController.swift
//  BA-iOS-Application
//
//  Created by Vincent Dupuis on 2016-02-13.
//  Copyright © 2016 Samuel Bellerose. All rights reserved.
//

import UIKit

class OffersViewController : UITableViewController {
    
    static let storyboardName = "Profile"
    static let viewControllerIdentifier = "OffersViewController"
    static let offersCellNibName = "OffersTableViewCell"
    static let offersCellIdentifier = "OffersTableViewCell"
    
    var offers: [Participation] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let offerCellNib = UINib(nibName: OffersViewController.offersCellNibName, bundle: nil)
        
        self.tableView.registerNib(offerCellNib, forCellReuseIdentifier: OffersViewController.offersCellIdentifier)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.rowHeight = 70.0
        self.tableView.tableFooterView = UIView(frame: CGRect.zero)
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(OffersViewController.offersCellIdentifier, forIndexPath: indexPath) as! OffersTableViewCell
            
        let offer = self.offers[indexPath.row]
        
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        
        cell.offerImage.image = UIImage(named: offer.user.photo)
        cell.offerDescription.text = offer.user.description
        cell.offerButton.addTarget(self, action: "selectOffer:", forControlEvents: .TouchUpInside)
        cell.offerButton.tag = indexPath.row
        cell.offerButton.layer.cornerRadius = 5
        
        return cell
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.offers.count
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            self.offers.removeAtIndex(indexPath.row)
            self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }
    
    func selectOffer(sender: UIButton!) {
        let alert = UIAlertController(title: "", message: "Êtes-vous certain(e) de vouloir accepter cette offre?", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: { action in
            switch action.style{
            case .Default:
                let indexPath = self.tableView.indexPathForCell(sender.superview?.superview as! UITableViewCell)
                self.offers.removeAtIndex(indexPath!.row)
                self.tableView.deleteRowsAtIndexPaths([indexPath!], withRowAnimation: .Fade)
                
            case .Cancel:
                print("cancel")
                
            case .Destructive:
                print("destructive")
            }
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .Default, handler: { action in
            switch action.style{
            case .Default:
                print("default")
            case .Cancel:
                print("cancel")
                
            case .Destructive:
                print("destructive")
            }
        }))

        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    class func detailViewControllerForOffers(offers: [Participation]) -> OffersViewController {
        let storyboard = UIStoryboard(name: OffersViewController.storyboardName, bundle: nil)
        let vc = storyboard.instantiateViewControllerWithIdentifier(OffersViewController.viewControllerIdentifier) as! OffersViewController
        
        vc.offers = offers
        
        return vc
    }
    
    
}