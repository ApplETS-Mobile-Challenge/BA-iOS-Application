//
//  SearchTableViewController.swift
//  BA-iOS-Application
//
//  Created by ApplETS on 2016-02-13.
//  Copyright © 2016 Samuel Bellerose. All rights reserved.
//

import UIKit

class SearchTableViewController: UITableViewController, UISearchBarDelegate, UISearchDisplayDelegate {

    var users = ["Richer", "Maxime", "Samuel", "Vincent"]
    var userSearchResults:Array<String>?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Section \(section)"
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("UserCell", forIndexPath: indexPath)

        // Configure the cell...
        cell.textLabel?.text = users[indexPath.row]

        return cell
    }
    
    func filterContentForSearchName(searchText: String) {
        //Filter the array using the filter method
        if self.users == nil {
            self.userSearchResults = nil
            return
        }
    }
    

}
