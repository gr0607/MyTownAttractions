//
//  ViewController.swift
//  MyTownAttractions
//
//  Created by admin on 09.02.2021.
//

import UIKit

class MainViewController: UIViewController {
    
    var locationManager = MyLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.configLocationManager()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }
}

