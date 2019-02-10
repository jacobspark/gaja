//
//  MapViewController.swift
//  gaja
//
//  Created by Jacob Park on 2/3/19.
//  Copyright © 2019 Jacob Park. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces
import RealmSwift

class MapViewController: UIViewController, CLLocationManagerDelegate, GMSMapViewDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    let myLocation = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GMSServices.provideAPIKey("AIzaSyBhL1bAvCDjR8UlHYoz5wPPeBn7OAWibYE")
        GMSPlacesClient.provideAPIKey("AIzaSyD-yLw0a8Nxel5oXotgqHbqI5tIA9t2Ewo")
        
        myLocation.delegate = self
        myLocation.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        myLocation.requestWhenInUseAuthorization()
        

        // Do any additional setup after loading the view.
    }
}


