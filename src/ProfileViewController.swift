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
    
    static let pendingCellNibName = "PendingDeedTableViewCell"
    static let pendingCellIdentifier = "PendingDeedTableViewCell"
    static let completedNibName = "CompletedDeedTableViewCell"
    static let completedCellIdentifier = "CompletedDeedTableViewCell"
    
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.user!.participations.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        if indexPath.row == 0 && self.user!.goodDeeds.count > 0 {
//            let cell = tableView.dequeueReusableCellWithIdentifier(LeaderboardViewController.podiumCellIdentifier, forIndexPath: indexPath) as! PodiumTableViewCell
//            return cell
//        } else {
//            let cell = tableView.dequeueReusableCellWithIdentifier(LeaderboardViewController.leaderboardCellIdentifier, forIndexPath: indexPath) as! LeaderboardTableViewCell
//            
//            return cell
//        }
        
        return UITableViewCell()
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
}

