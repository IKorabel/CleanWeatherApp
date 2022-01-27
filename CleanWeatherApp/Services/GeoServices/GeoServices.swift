//
//  GeoServices.swift
//  CleanWeatherApp
//
//  Created by Игорь Корабельников on 27.01.2022.
//

import UIKit
import MapKit
import CoreLocation

class GeoServices: NSObject {
    var locationManager = CLLocationManager()
    var currentLocation: CLLocation?
    
    /// Определить местоположение пользователя
    func defineUserLocation() {
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestWhenInUseAuthorization()
            locationManager.requestLocation()
        }
    }
    /// Определить адрес
    func defineAddress(lat: Double, lon: Double, completion: @escaping (CLPlacemark?) -> Void) {
        let location = CLLocation(latitude: lat, longitude: lon)
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location) { placemarks, error in
            guard let place = placemarks?.first, error == nil else {
                print(error!.localizedDescription)
                completion(nil)
                return
            }
            completion(place)
        }
    }

}

extension GeoServices: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if !locations.isEmpty, currentLocation == nil {
            currentLocation = locations.first
            locationManager.stopUpdatingLocation()
            requestWeatherForLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Ошибка геолокации: \(error.localizedDescription)")
    }
    
    func requestWeatherForLocation() {
        guard let location = currentLocation else { return }
        let longitude = location.coordinate.longitude
        let latitude = location.coordinate.latitude
        print("long: \(longitude), latitude: \(latitude)")
    }
    
}
