//
//  BASubscriptionViewController.swift
//  BA-iOS-Application
//
//  Created by Maxime Mongeau on 2016-02-13.
//  Copyright © 2016 Samuel Bellerose. All rights reserved.
//

import UIKit

class BASubscriptionViewController: UIViewController {
    
    var goodDeed: GoodDeed?

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descTextView: UITextView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var dateDebutLabel: UILabel!
    @IBOutlet weak var dateFinLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let gd = goodDeed {
            self.title = gd.title
            let formatter = NSDateFormatter()
            formatter.dateFormat = "YYYY/MM/dd - HH:mm"
            self.descTextView.text = gd.desc
            self.dateDebutLabel.text = formatter.stringFromDate(gd.startDate)
            self.dateFinLabel.text = formatter.stringFromDate(gd.endDate)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelTapped(sender: UIBarButtonItem) {
        self.presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
