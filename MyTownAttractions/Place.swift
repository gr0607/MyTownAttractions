//
//  Place.swift
//  MyTownAttractions
//
//  Created by admin on 09.02.2021.
//

import Foundation


struct Place {
    var title: String
    var info: String
    var latitude: Double
    var longitude: Double
    var imageString: String
    
    
    static func getPlaces() -> [Place] {
        return [ Place(title: "Gatchina Palace", info: "Palace", latitude: 59.563943, longitude: 30.108097, imageString: "palace_one"),
                 Place(title: "Cathedral of St. Paul the Apostle", info: "Sobor", latitude: 59.564923, longitude: 30.129899, imageString: "chirch"),
                 Place(title: "Ingerburg", info: "Vorota", latitude: 59.576524, longitude: 30.131897, imageString: "gate"),
                 Place(title: "Priorat Palace", info: "Priorat", latitude: 59.558281, longitude: 30.121392, imageString: "palace_two"),
                 Place(title: "Museum of Gatchina", info: "musei", latitude: 59.569941, longitude: 30.122551, imageString: "museum")
        ]
    }
}

// home 59.580240, 30.121994
