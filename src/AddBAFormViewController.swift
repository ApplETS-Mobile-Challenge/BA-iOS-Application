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
}
