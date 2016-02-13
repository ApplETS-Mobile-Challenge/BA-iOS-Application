//
//  AddBAFormViewController.swift
//  BA-iOS-Application
//
//  Created by Maxime Mongeau on 2016-02-12.
//  Copyright © 2016 Samuel Bellerose. All rights reserved.
//

import UIKit
import Eureka

class AddBAFormViewController: FormViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        form +++= TextRow("Titre"){$0.title = "Titre"}
    }
}
