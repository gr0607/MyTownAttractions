//
//  GoogleViewController.swift
//  MyTownAttractions
//
//  Created by admin on 11.02.2021.
//

import UIKit
import GoogleMaps

class GoogleViewController: UIViewController, GMSMapViewDelegate {

    @IBOutlet weak var mapView: GMSMapView!
    
    let places = Place.getPlaces()
    let manager = MyLocationManager().locationManager
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        convertToGoogleMarkers()
    }
    
    @IBAction func zoomOutPressed(_ sender: Any) {
        let zoomCamera = GMSCameraUpdate.zoomOut()
        mapView.animate(with: zoomCamera)
    }
    
    
    @IBAction func zoomInPressed(_ sender: Any) {
        let zoomCamera = GMSCameraUpdate.zoomIn()
        mapView.animate(with: zoomCamera)
    }
    
    @IBAction func showMePressed(_ sender: Any) {
        guard let coordinate = manager.location?.coordinate else { return }
        let marker = GMSMarker()
        marker.title = "ME"
        marker.position = CLLocationCoordinate2D(latitude: coordinate.latitude, longitude: coordinate.longitude)
        let camera = GMSCameraPosition.camera(withLatitude: coordinate.latitude, longitude: coordinate.longitude, zoom: 13.0)
        marker.map = mapView
        mapView.camera = camera
    }
    
    @IBAction func showAttractionsPressed(_ sender: Any) {
              let camera = GMSCameraPosition.camera(withLatitude: 59.569941, longitude:30.122551, zoom: 13.0)
        mapView.camera = camera
    }
    
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        print(marker.title!)
        return true
    }
    
    func convertToGoogleMarkers() {
        for place in places {
            let marker = GMSMarker()
            marker.position = CLLocationCoordinate2D(latitude: place.latitude, longitude: place.longitude)
            marker.title = place.title
            marker.snippet = place.info
            
            marker.icon = UIImage(named: place.imageString)?.withRenderingMode(.alwaysTemplate)
            marker.map = mapView
        }
    }
}
