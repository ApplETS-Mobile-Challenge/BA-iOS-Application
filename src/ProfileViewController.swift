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
    @IBOutlet weak var pendingOffersTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var nameLabel: UILabel!

    static let storyboardName = "Profile"
    static let viewControllerIdentifier = "ProfileViewController"
    static let participationCellNibName = "ParticipationTableViewCell"
    static let participationCellIdentifier = "ParticipationTableViewCell"
    
    var user: User?
    var pendingParticipations: [Participation] = []
    var completedParticipations: [Participation] = []
    var inProgressParticipations: [Participation] = []
    var offers: [Participation] = []
    
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
            let participation = self.inProgressParticipations[indexPath.row]
            cell.participationImage.image = UIImage(named: participation.goodDeed.creator.photo)
            cell.descriptionLabel.text = participation.goodDeed.description
            cell.statusImage.image = UIImage(named: "star")
            cell.statusImage.image = cell.statusImage.image!.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
            cell.statusImage.tintColor = UIColor(red: 0/255, green: 146/255, blue: 214/255, alpha: 1.0) /* #0092d6 */
            
            let timeDifHours = participation.goodDeed.startDate.timeIntervalSinceNow
            
            if timeDifHours > 86400 {
                cell.timeLabel.text = "\(Int(ceil(timeDifHours / 86400)))j"
            } else if timeDifHours > 3600 {
                cell.timeLabel.text = "\(Int(ceil(timeDifHours / 3600)))h"
            } else {
                cell.timeLabel.text = "\(Int(ceil(timeDifHours / 60)))m"
            }
            
        } else if indexPath.section == 1 {
            
            let participation = self.pendingParticipations[indexPath.row]
            cell.participationImage.image = UIImage(named: participation.goodDeed.creator.photo)
            cell.descriptionLabel.text = participation.goodDeed.description
            cell.statusImage.image = UIImage(named: "clock")
            cell.statusImage.image = cell.statusImage.image!.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
            cell.statusImage.tintColor = UIColor(red: 0/255, green: 146/255, blue: 214/255, alpha: 1.0) /* #0092d6 */
            
            let timeDifHours = participation.goodDeed.startDate.timeIntervalSinceNow
            
            if timeDifHours > 86400 {
                cell.timeLabel.text = "\(Int(ceil(timeDifHours / 86400)))j"
            } else if timeDifHours > 3600 {
                cell.timeLabel.text = "\(Int(ceil(timeDifHours / 3600)))h"
            } else {
                cell.timeLabel.text = "\(Int(ceil(timeDifHours / 60)))m"
            }
            
        } else if indexPath.section == 2 {
            let participation = self.completedParticipations[indexPath.row]
            cell.participationImage.image = UIImage(named: participation.goodDeed.creator.photo)
            cell.descriptionLabel.text = participation.goodDeed.description
            cell.statusImage.image = UIImage(named: "checkmark")
            cell.statusImage.image = cell.statusImage.image!.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
            cell.statusImage.tintColor = UIColor(red: 45/255, green: 191/255, blue: 77/255, alpha: 1.0) /* #2dbf4d */
            
            let timeDifHours = participation.goodDeed.endDate.timeIntervalSinceNow
            
            if timeDifHours > 86400 {
                cell.timeLabel.text = "\(Int(ceil(timeDifHours / 86400)))j"
            } else if timeDifHours > 3600 {
                cell.timeLabel.text = "\(Int(ceil(timeDifHours / 3600)))h"
            } else {
                cell.timeLabel.text = "\(Int(ceil(timeDifHours / 60)))m"
            }
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return self.inProgressParticipations.count
        }
        else if section == 1 {
            return self.pendingParticipations.count
        }
        else if section == 2 {
            return self.completedParticipations.count
        }
        
        return 0
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "PARTICIPATIONS EN COURS"
        } else if section == 1 {
            return "PARTICIPATIONS EN ATTENTE"
        } else {
            return "PARTICIPATIONS COMPLÉTÉES"
        }
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 && self.inProgressParticipations.count == 0 {
            return 0
        } else if section == 1 && self.pendingParticipations.count == 0 {
            return 0
        } else if section == 2 && self.completedParticipations.count == 0 {
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
            let pvc = OffersViewController.detailViewControllerForOffers(self.offers)
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
        //TODO: loaded avec le bon user
        UserRequest.sharedInstance.getUser() { (user: User) in
            self.user = user
            self.loadParticipations()
        }
    }
    
    private func loadParticipations() {
        //TODO: loaded avec le bon user
        ParticipationRequest.sharedInstance.getParticipationsByUser(self.user!.id) { (participations: [Participation]) in
            self.user?.participations = participations
            self.loadOffers()
        }
    }
    
    private func loadOffers() {
        ParticipationRequest.sharedInstance.getParticipationsByUser(self.user!.id) { (offers: [Participation]) in
            self.offers = offers
            self.initFields()
        }
    }
    
    private func initFields() {
        self.navigationItem.title = self.user!.username
        self.nameLabel.text = self.user!.name
        self.profileImage.image = UIImage(named: self.user!.photo)
        self.descriptionLabel.text = self.user!.description
        self.starRating.rating = self.user!.rating
        
        if self.user!.id == AuthUser.sharedInstance.id {
            if(self.offers.count == 0) {
                self.hideOfferButton()
            } else if(self.offers.count == 1) {
                self.pendingOffersButton.setTitle("1 Offre en attente", forState: .Normal)
            } else {
                self.pendingOffersButton.setTitle("\(self.offers.count) Offres en attente", forState: .Normal)
            }
        } else {
            self.hideOfferButton()
        }
        
        self.pendingParticipations = self.user!.participations.filter({ p in p.status == Status.Pending})
        self.completedParticipations = self.user!.participations.filter({ p in p.status == Status.OK && p.goodDeed.endDate.timeIntervalSinceNow < 0})
        self.inProgressParticipations = self.user!.participations.filter({ p in p.status == Status.OK && p.goodDeed.endDate.timeIntervalSinceNow > 0})
        
        self.tableView.reloadData()
    }
    
    private func hideOfferButton() {
        self.pendingOffersTopConstraint.constant = -40
        self.pendingOffersButton.hidden = true
    }
}

