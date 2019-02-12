# gaja
This iOS app is designed for people who always eat at the same fast food chains or restaurants, and look for similar attractions or needs wherever they go. This app brings great convenience to those who look for minimizing their time to locate their frequently visited places. 

## Getting Started
Gaja allows the user to create a category of desired locations or attractions (Restaurants, In-N-Out, Milk Tea, etc.), and enter places in the category. These categories and items are saved on the phone, and the locations are mapped on Google Maps, returning the results around their current location. 

### Prerequisites
* **Cocoapods** 
* **XCode 10**
* **Google Maps API Key (GoogleMaps iOS SDK and Google Places API Enabled)**

### Installation
To install Cocoapods, open terminal and copy paste the following command:
```
sudo gem install cocoapods
```
Documentation for Cocoapods can be found in this [link](https://guides.cocoapods.org/using/getting-started.html)

To install XCode, open your App Store and install the latest version of XCode.

Locate AppDelegates.swift and MapViewController.swift in 
```
gaja/Supporting\ Files/AppDelegate.swift
gaja/Controllers/MapViewController.swift
```
Add your API key where specified.


The current app only supports iPhones.

## Built With
* [Cocoapods](https://cocoapods.org/about) - Dependency Management
* [Realm](https://realm.io/) - Realm Database
* [GoogleMaps](https://developers.google.com/maps/documentation/ios-sdk/intro) - Google Maps iOS SDK
* [GooglePlaces](https://developers.google.com/places/web-service/intro) - Google Places API
* [Alamofire](https://github.com/Alamofire/Alamofire) - HTTP Networking Library
* [SwiftyJSON](https://github.com/SwiftyJSON/SwiftyJSON) - Swift library for JSON handling

## Future Considerations
* Better UI Design
* Improved user experience
