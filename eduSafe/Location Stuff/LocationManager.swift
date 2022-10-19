//
//  LocationManager.swift
//  eduSafe
//
//  Created by Aidan Palmer on 10/14/22.
//
import CoreLocation

class LocationManager: NSObject, ObservableObject {
    private let manager = CLLocationManager() // monitor changes, request etc.
    @Published var userLocation: CLLocation? //do we have our user location??
    static let shared = LocationManager() //access location manager from anywhere in our app
    
    override init() {
        super.init()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest //standard
        manager.startUpdatingLocation()
    }
    
    func requestLocation() {
        manager.requestWhenInUseAuthorization()
    }
    
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        let authorizationStatus: CLAuthorizationStatus

        if #available(iOS 14, *) {
            authorizationStatus = manager.authorizationStatus
        } else {
            authorizationStatus = CLLocationManager.authorizationStatus()
        }
        switch authorizationStatus {
        case .restricted, .denied:
            print("DEBUG: Must enable")
        default:
            print("good work!")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {return}
        self.userLocation = location
    }
}
