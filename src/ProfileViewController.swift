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
        return self.users.count + (self.podiumUsers.count > 0 ? 1 : 0)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.row == 0 && podiumUsers.count > 0 {
            let cell = tableView.dequeueReusableCellWithIdentifier(LeaderboardViewController.podiumCellIdentifier, forIndexPath: indexPath) as! PodiumTableViewCell
            cell.selectionStyle = UITableViewCellSelectionStyle.None
            
            let usernameLabels = [
                cell.firstLabel,
                cell.secondLabel,
                cell.thirdLabel
            ]
            
            let karmaLabels = [
                cell.firstKarmaLabel,
                cell.secondKarmaLabel,
                cell.thirdKarmaLabel
            ]
            
            let buttons = [
                cell.firstButton,
                cell.secondButton,
                cell.thirdButton
            ]
            
            for i in 0...2 {
                usernameLabels[i].text = self.podiumUsers[i].username
                karmaLabels[i].text = "\(self.podiumUsers[i].karma!)"
                buttons[i].addTarget(self, action: "profileTap:", forControlEvents: .TouchUpInside)
                buttons[i].tag = i
            }
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCellWithIdentifier(LeaderboardViewController.leaderboardCellIdentifier, forIndexPath: indexPath) as! LeaderboardTableViewCell
            
            let user = self.users[indexPath.row - 1] as User
            cell.rankLabel.text = "#\(indexPath.row + 2)"
            cell.usernameLabel.text = user.username
            cell.karmaLabel.text = "\(user.karma!)"
            
            return cell
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row == 0 {
            return
        }
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        if let navigationController = self.navigationController {
            let pvc = ProfileViewController.detailViewControllerForUser(self.users[indexPath.row - 1])
            navigationController.pushViewController(pvc, animated: true)
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 160.0
        } else {
            return 61.0
        }
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }

}

