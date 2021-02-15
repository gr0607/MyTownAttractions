//
//  AppleMapsViewController.swift
//  MyTownAttractions
//
//  Created by admin on 09.02.2021.
//

import UIKit
import MapKit
import CoreLocation

class AppleMapsViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var myMap: MKMapView!
    
    var applePlaces = ApplePlace.getApplePlaces()
    var manager = MyLocationManager().locationManager
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myMap.delegate = self
        myMap.addAnnotations(applePlaces)
        getUserLocation(with: 40000)
        
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: "MyMarker")
        
        switch annotation.title {
        case "Gatchina Palace":
            annotationView.glyphImage = UIImage(named: "palace_one")
        case "Cathedral of St. Paul the Apostle":
            annotationView.glyphImage = UIImage(named: "chirch")
        case "Ingerburg":
            annotationView.glyphImage = UIImage(named: "gate")
        case "Priorat Palace":
            annotationView.glyphImage = UIImage(named: "palace_two")
        case "Museum of Gatchina":
            annotationView.glyphImage = UIImage(named: "museum")
        default:
            print("default")
        }
        return annotationView
    }
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        guard let name = view.annotation?.title as? String else { return }
        print(name)
    }
  
    @IBAction func decreaseMapSize(_ sender: UIButton) {
        zoomMap(with: 1.3)
    }
    
    @IBAction func increaseMapSize(_ sender: UIButton) {
        zoomMap(with: 0.7)
    }
    
    @IBAction func showMe(_ sender: Any) {
        getUserLocation(with: 3000)
    }
    
    @IBAction func showAttrctions(_ sender: Any) {
        guard let location = applePlaces.last?.coordinate else { return }
        let region = MKCoordinateRegion.init(center: location, latitudinalMeters: 3000, longitudinalMeters: 3000)
        myMap.setRegion(region, animated: true)
    }
    
    func zoomMap(with delta: Double) {
        var region = myMap.region
        var span = myMap.region.span
        
        span.latitudeDelta *= delta
        span.longitudeDelta *= delta
        region.span = span
        myMap.setRegion(region, animated: true)
    }
    
    func getUserLocation(with precise: CLLocationDistance) {
            if let location = manager.location?.coordinate {
                let region = MKCoordinateRegion.init(center: location, latitudinalMeters: precise, longitudinalMeters: precise)
                myMap.setRegion(region, animated: true)
                myMap.showsUserLocation = true
            }
    }
    
}
