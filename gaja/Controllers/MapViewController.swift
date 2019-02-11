//  MapViewController.swift
//  gaja
//
//  Copyright © 2019 Jacob Park. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces
import RealmSwift
import Alamofire

class MapViewController: UIViewController, GMSMapViewDelegate {
    
    let PLACES_URL = "https://maps.googleapis.com/maps/api/place/nearbysearch/json"
    let PLACES_KEY = "AIzaSyD-yLw0a8Nxel5oXotgqHbqI5tIA9t2Ewo"
    let realm = try! Realm()
    var places: Results<Data>?
    
    @IBOutlet weak var mapView: GMSMapView!
    
    let locationManager = CLLocationManager()
    var currentLocation: CLLocation?
    var placesClient: GMSPlacesClient!
    var zoomLevel: Float = 15.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadItems()
    
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.distanceFilter = 50
        locationManager.startUpdatingLocation()
        locationManager.delegate = self
        
        placesClient = GMSPlacesClient.shared()
        

        // An array to hold the list of likely places.
        // var likelyPlaces: [GMSPlace] = []
        
        // The currently selected place.
        // var selectedPlace: GMSPlace?

        // Do any additional setup after loading the view.
    }
    func loadItems() {
        places = realm.objects(Data.self)
    }
    
    func getRequest(_ searchPlace: String, _ parameters: Parameters) {
        var newParameters = parameters
        newParameters["keyword"] = searchPlace
        Alamofire.request(PLACES_URL, method: .get, parameters: newParameters).responseJSON { response in
            print("Request: \(String(describing: response.request))")   // original url request
            print("Response: \(String(describing: response.response))") // http url response
            print("Result: \(response.result)")                         // response serialization result
            
            if let json = response.result.value {
                print("JSON: \(json)") // serialized json response
            }
            
            
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                print("Data: \(utf8Text)") // original server data as UTF8 string
            }
        }
    }
    
}

extension MapViewController: CLLocationManagerDelegate {
    
    // Handle incoming location events.
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location: CLLocation = locations.last!
        print("Location: \(location)")
        print("Hello: \(location.coordinate.latitude), \(location.coordinate.longitude)")
        let parameters: Parameters = [
            "location" : "\(location.coordinate.latitude), \(location.coordinate.longitude)",
            "radius" : 1000,
            "key" : PLACES_KEY,
        ]
        if places?.isEmpty ?? true {
            let alert = UIAlertController(title: "No places added", message: "Please add places in the category", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Understood", style: .default, handler: nil))
        }
        else {
            for places in places! {
                let eachLocationInput = places.title
                getRequest(eachLocationInput, parameters)
            }
        }

        let camera = GMSCameraPosition.camera(withLatitude: location.coordinate.latitude,
                                              longitude: location.coordinate.longitude,
                                              zoom: zoomLevel)
        
        if mapView.isHidden {
            mapView.isHidden = false
            mapView.camera = camera
        } else {
            mapView.animate(to: camera)
        }
        
        // listLikelyPlaces()
    }
    
    // Handle authorization for the location manager.
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .restricted:
            print("Location access was restricted.")
        case .denied:
            print("User denied access to location.")
            // Display the map using the default location.
            mapView.isHidden = false
        case .notDetermined:
            print("Location status not determined.")
        case .authorizedAlways: fallthrough
        case .authorizedWhenInUse:
            print("Location status is OK.")
        }
        mapView.isMyLocationEnabled = true
        mapView.settings.myLocationButton = true
    }
    
    // Handle location manager errors.
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        locationManager.stopUpdatingLocation()
        print("Error: \(error)")
    }
    
}
