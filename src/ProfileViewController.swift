//
//  ProfileViewController.swift
//  BA-iOS-Application
//
//  Created by Samuel Bellerose on 2016-02-12.
//  Copyright © 2016 Samuel Bellerose. All rights reserved.
//

import UIKit
import Cosmos

class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var starRating: CosmosView!
    @IBOutlet weak var pendingOffersButton: UIButton!
    @IBOutlet weak var tableView: UITableView!

    static let storyboardName = "Profile"
    static let viewControllerIdentifier = "ProfileViewController"
    static let participationCellNibName = "ParticipationTableViewCell"
    static let participationCellIdentifier = "ParticipationTableViewCell"
    
    var user: User?
    var pendingParticipations: [Participation] = []
    var completedParticipations: [Participation] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let participationCellNib = UINib(nibName: ProfileViewController.participationCellNibName, bundle: nil)
        
        self.pendingOffersButton.addTarget(self, action: "viewPendingOffers:", forControlEvents: .TouchUpInside)
        
        self.tableView.registerNib(participationCellNib, forCellReuseIdentifier: ProfileViewController.participationCellIdentifier)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.rowHeight = 70.0
        self.tableView.tableFooterView = UIView(frame: CGRect.zero)
        self.pendingOffersButton.layer.cornerRadius = 5
        
        self.loadUser()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(ProfileViewController.participationCellIdentifier, forIndexPath: indexPath) as! ParticipationTableViewCell
        
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        
        if indexPath.section == 0 {
            
            let participation = self.pendingParticipations[indexPath.row]
            cell.participationImage.image = UIImage(named: participation.goodDeed.creator.photo)
            cell.descriptionLabel.text = participation.goodDeed.description
            cell.statusImage.image = UIImage(named: "clock")
            cell.statusImage.image = cell.statusImage.image!.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
            cell.statusImage.tintColor = UIColor(red: 0/255, green: 146/255, blue: 214/255, alpha: 1.0) /* #0092d6 */
            
        } else if indexPath.section == 1 {
            let participation = self.completedParticipations[indexPath.row]
            cell.participationImage.image = UIImage(named: participation.goodDeed.creator.photo)
            cell.descriptionLabel.text = participation.goodDeed.description
            cell.statusImage.image = UIImage(named: "checkmark")
            cell.statusImage.image = cell.statusImage.image!.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
            cell.statusImage.tintColor = UIColor(red: 45/255, green: 191/255, blue: 77/255, alpha: 1.0) /* #2dbf4d */
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return self.pendingParticipations.count
        } else if section == 1 {
            return self.completedParticipations.count
        }
        
        return 0
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "PARTICIPATIONS EN ATTENTE"
        } else {
            return "PARTICIPATION COMPLÉTÉES"
        }
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 && self.pendingParticipations.count == 0 {
            return 0
        } else if section == 1 && self.completedParticipations.count == 0 {
            return 0
        }
        
        return 40
    }
    
    func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int)
    {
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.font = UIFont(name: (header.textLabel?.font?.fontName)!, size: 12)!
        header.textLabel?.textColor = UIColor.darkGrayColor()
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    func viewPendingOffers(sender: UIButton!) {
        if let navigationController = self.navigationController {
            let pvc = OffersViewController.detailViewControllerForOffers(self.pendingParticipations)
            navigationController.pushViewController(pvc, animated: true)
        }
    }
    
    class func detailViewControllerForUser(user: User) -> ProfileViewController {
        let storyboard = UIStoryboard(name: ProfileViewController.storyboardName, bundle: nil)
        let vc = storyboard.instantiateViewControllerWithIdentifier(ProfileViewController.viewControllerIdentifier) as! ProfileViewController
        
        vc.user = user
        
        return vc
    }
    
    private func loadUser() {
        UserRequest.sharedInstance.getUser() { (user: User) in
            self.user = user
            
            self.profileImage.image = UIImage(named: user.photo)
            self.descriptionLabel.text = user.description
            self.starRating.rating = user.rating
            self.navigationItem.title = user.username
            
            self.pendingParticipations = user.participations.filter({ p in p.status == Status.Pending})
            self.completedParticipations = user.participations.filter({ p in p.status == Status.OK})
            
            self.tableView.reloadData()
        }
    }
}

