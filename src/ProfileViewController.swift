//
//  ProfileViewController.swift
//  BA-iOS-Application
//
//  Created by Samuel Bellerose on 2016-02-12.
//  Copyright © 2016 Samuel Bellerose. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var subDescriptionLabel: UILabel!
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
        
        self.tableView.registerNib(participationCellNib, forCellReuseIdentifier: ProfileViewController.participationCellIdentifier)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.loadUser()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(ProfileViewController.participationCellIdentifier, forIndexPath: indexPath) as! ParticipationTableViewCell
        
        if indexPath.section == 1 {
            
            let participation = self.pendingParticipations[indexPath.row]
            
            //TODO setter image
            //cell.imageView = participation.goodDeed.creator.photo
            cell.descriptionLabel.text = participation.goodDeed.description
            cell.statusImage.image = UIImage(named: "clock")
            
        } else if indexPath.section == 2 {
            let participation = self.completedParticipations[indexPath.row]
            
            //TODO setter image
            //cell.imageView = participation.goodDeed.creator.photo
            cell.descriptionLabel.text = participation.goodDeed.description
            cell.statusImage.image = UIImage(named: "checkmark")
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row == 0 {
            return
        }
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        if let navigationController = self.navigationController {
//            let pvc = ProfileViewController.detailViewControllerForUser(self.users[indexPath.row - 1])
//            navigationController.pushViewController(pvc, animated: true)
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 1 {
            return self.pendingParticipations.count
        } else if section == 2 {
            return self.completedParticipations.count
        }
        
        return 0
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Offres en attente"
        } else {
            return "Offres completées"
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    
    class func detailViewControllerForGame(user: User) -> ProfileViewController {
        let storyboard = UIStoryboard(name: ProfileViewController.storyboardName, bundle: nil)
        let vc = storyboard.instantiateViewControllerWithIdentifier(ProfileViewController.viewControllerIdentifier) as! ProfileViewController
        
        vc.user = user
        //self.tableView.reloadData()
        
        return vc
    }
    
    private func loadUser() {
//        UserRequest.sharedInstance.getUser(self.user.id) { (user: User) in
//            self.user = user
//        }
    }
}

