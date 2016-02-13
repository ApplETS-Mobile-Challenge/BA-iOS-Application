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
            self.usernameLabel.text = gd.creator.name
            self.imageView.image = UIImage(named: gd.creator.name)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelTapped(sender: UIBarButtonItem) {
        self.presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func propositionTapped() {
        
    }

}
