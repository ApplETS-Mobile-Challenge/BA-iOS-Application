//
//  LocationRow.swift
//  BA-iOS-Application
//
//  Created by Maxime Mongeau on 2016-02-13.
//  Copyright © 2016 Samuel Bellerose. All rights reserved.
//

import Foundation
import UIKit
import Eureka
import MapKit

public final class LocationRow : SelectorRow<CLLocation, LocationSelectionViewController>, RowType {
    public required init(tag: String?) {
        super.init(tag: tag)
        presentationMode = .Show(controllerProvider: ControllerProvider.Callback { return LocationSelectionViewController(){ _ in } }, completionCallback: { vc in vc.navigationController?.popViewControllerAnimated(true) })
        displayValueFor = {
            guard let location = $0 else { return "" }
            let fmt = NSNumberFormatter()
            fmt.maximumFractionDigits = 4
            fmt.minimumFractionDigits = 4
            let latitude = fmt.stringFromNumber(location.coordinate.latitude)!
            let longitude = fmt.stringFromNumber(location.coordinate.longitude)!
            return  "\(latitude), \(longitude)"
        }
    }
}