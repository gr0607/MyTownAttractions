//
//  MyLocationManager.swift
//  MyTownAttractions
//
//  Created by admin on 09.02.2021.
//

import Foundation
import CoreLocation
import MapKit
import UIKit

class MyLocationManager:NSObject, CLLocationManagerDelegate {
   
     var locationManager : CLLocationManager = CLLocationManager()
    
    func configLocationManager() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestWhenInUseAuthorization()
            } else {
            print("Location service is disbled")
        }
    }
}
