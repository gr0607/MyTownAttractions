//
//  ApplePlace.swift
//  MyTownAttractions
//
//  Created by admin on 11.02.2021.
//

import Foundation
import MapKit

class ApplePlace: NSObject, MKAnnotation {
    var title: String?
    var info: String
    var coordinate: CLLocationCoordinate2D
   
        
    init(title: String, info: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.info = info
        self.coordinate = coordinate
       
    }
    
    static func getApplePlaces() -> [ApplePlace] {
        var applePlaces: [ApplePlace] = []
        let places = Place.getPlaces()
        for place in places {
            applePlaces.append(ApplePlace(title: place.title, info: place.info, coordinate: CLLocationCoordinate2D(latitude: place.latitude, longitude: place.longitude)))
        }
        return applePlaces
    }
}
