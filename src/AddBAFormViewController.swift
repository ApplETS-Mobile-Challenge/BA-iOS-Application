//
//  AddBAFormViewController.swift
//  BA-iOS-Application
//
//  Created by Maxime Mongeau on 2016-02-12.
//  Copyright © 2016 Samuel Bellerose. All rights reserved.
//

import UIKit
import Eureka
import MapKit
import SwiftyJSON

class AddBAFormViewController: FormViewController {
    
    let user: String = "Super user"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Nouvelle BA"
        form
            +++= TextRow("title"){
                $0.title = "Titre"
                $0.placeholder = "Requis"
            }
            <<< TextAreaRow("description"){$0.placeholder = "Description"}
            <<< DateTimeInlineRow("startDate"){$0.title = "Début"}
            <<< DateTimeInlineRow("endDate"){$0.title = "Fin"}
            <<< IntRow("nbBenevole"){$0.title = "Nombre de bénévoles"}
            <<< LocationRow("location"){
                $0.title = "Lieu"
            }
    }
    
    @IBAction func cancelPressed(sender: UIBarButtonItem) {
        self.presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func donePressed(sender: UIBarButtonItem) {
        var formattedData = [String: AnyObject]()
        for (tag, value) in form.values() {
            guard let value = value else {
                let ac = UIAlertController(title: "Erreur", message: "Le champs \(tag) n'est pas remplie", preferredStyle: .Alert)
                ac.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
                self.presentViewController(ac, animated: true, completion: nil)
                return
            }
            if tag == "startDate" || tag == "endDate" {
               let date = (value as! NSDate).timeIntervalSince1970
                formattedData[tag] = date
            } else if tag == "location" {
                let coordinate = (value as! CLLocation).coordinate
                formattedData[tag] = ["longitude": coordinate.longitude, "latitude": coordinate.latitude]
            } else {
                formattedData[tag] = (value as! AnyObject)
            }
        }
        let jsonData = try? NSJSONSerialization.dataWithJSONObject(formattedData, options: .PrettyPrinted)
    }
}
