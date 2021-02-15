//
//  YandexViewController.swift
//  MyTownAttractions
//
//  Created by admin on 13.02.2021.
//

import UIKit
import YandexMapsMobile

class YandexViewController: UIViewController,  YMKMapObjectTapListener {
   
    @IBOutlet weak var mapView: YMKMapView!
    let manager = MyLocationManager().locationManager
    var objectNames: [YMKPlacemarkMapObject: String] = [:]
    var map: YMKMap?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        map = mapView.mapWindow.map
    }
    
    @IBAction func showMePressed(_ sender: Any) {
       getUserPosition()
    }
    
    @IBAction func attractionsPressed(_ sender: Any) {
        convertToYandexMarker()
    }
    
    @IBAction func zoomOutPressed(_ sender: Any) {
        zoomWithStep(step: -1)
    }
    
    @IBAction func zoomInPressed(_ sender: Any) {
        zoomWithStep(step: 1)
    }
    
    func zoomWithStep(step: Float) {
        mapView.mapWindow.map.move(
            with: YMKCameraPosition.init(target: (map?.cameraPosition.target)!, zoom: (map?.cameraPosition.zoom)! + step, azimuth: 0, tilt: 0),
               animationType: YMKAnimation(type: YMKAnimationType.smooth, duration: 5),
               cameraCallback: nil)
    }

        
    func convertToYandexMarker() {
        map!.move(
               with: YMKCameraPosition.init(target: YMKPoint(latitude: 59.569941, longitude: 30.122551), zoom: 12, azimuth: 0, tilt: 0),
               animationType: YMKAnimation(type: YMKAnimationType.smooth, duration: 5),
               cameraCallback: nil)
        
        let mapObjects = mapView.mapWindow.map.mapObjects
        mapObjects.addTapListener(with: self)
        
        for place in Place.getPlaces() {
            let point = YMKPoint(latitude: place.latitude, longitude: place.longitude)
            let placemark = mapObjects.addPlacemark(with: point)
            objectNames[placemark] = place.title
            placemark.setIconWith(UIImage(named: place.imageString)!)
        }
    }
    
    func onMapObjectTap(with mapObject: YMKMapObject, point: YMKPoint) -> Bool {
        if let obj = mapObject as? YMKPlacemarkMapObject {
            print(objectNames[obj]!)
        }
        return true
    }
    
    func getUserPosition() {
        let mapObjects = mapView.mapWindow.map.mapObjects
        mapObjects.addTapListener(with: self)
        
        guard let coordinate = manager.location?.coordinate else { return }
        let point = YMKPoint(latitude: coordinate.latitude, longitude: coordinate.longitude)
        let placemark = mapObjects.addPlacemark(with: point)
        placemark.setIconWith(UIImage(systemName: "person.circle.fill")!)
        
        objectNames[placemark] = "YOU"
        
        map!.move(
            with: YMKCameraPosition.init(target: YMKPoint(latitude: coordinate.latitude , longitude: coordinate.longitude), zoom: 12, azimuth: 0, tilt: 0),
               animationType: YMKAnimation(type: YMKAnimationType.smooth, duration: 5),
               cameraCallback: nil)
    }
}
