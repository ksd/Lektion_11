//
//  LocationController.swift
//  Heroes
//
//  Created by ksd on 17/03/2022.
//

import Foundation
import MapKit


final class LocationController: NSObject, ObservableObject {
    
    var locationManager: CLLocationManager?
    
    @Published var coordinateRegion = MKCoordinateRegion()
    
    
    override init(){
        super.init()
        coordinateRegion.span = .init(latitudeDelta: 0.005, longitudeDelta: 0.005)
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        checkLocationAuthorization()
    }
    
    deinit{
        locationManager?.stopUpdatingLocation()
    }
    
    private func checkLocationAuthorization() {
        guard let locationManager = locationManager else { return }
        
        switch locationManager.authorizationStatus {
            
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("et eller andet")
        case .denied:
            print("NÅ! - nu er jeg sur")
        case .authorizedAlways, .authorizedWhenInUse:
            locationManager.startUpdatingLocation()
        @unknown default:
            break
        }
    }
    
    
}


extension LocationController: CLLocationManagerDelegate {
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        coordinateRegion.center = locations.first!.coordinate
    }
}
