//
//  CurrentWeatherViewController.swift
//  SampleWeatherApp
//
//  Created by Renata Guttenová on 29/09/2019.
//  Copyright © 2019 Renata Guttenová. All rights reserved.
//

import Alamofire
import CoreLocation
import UIKit

protocol CurrentWeatherControlling {
    var coordinator: CurrentWeatherCoordinating? { get set }
}

class CurrentWeatherViewController: UIViewController, CLLocationManagerDelegate, CurrentWeatherControlling {
    var coordinator: CurrentWeatherCoordinating?

    @IBOutlet var cityLabel: UILabel!
    @IBOutlet var weatherLabel: UILabel!
    @IBOutlet var weatherImageView: UIImageView!
    @IBOutlet var currentTemperatureLabel: UILabel!
    @IBOutlet var currentDateLabel: UILabel!

    let locationManager = CLLocationManager()
    var currentLocation: CLLocation!
    var currentWeather: CurrentWeather!

    override func viewDidLoad() {
        super.viewDidLoad()

        callDelegates()
        currentWeather = CurrentWeather()
        setupLocation()
    }

    override func viewDidAppear(_: Bool) {
        locationAuthCheck()
    }

    func callDelegates() {
        locationManager.delegate = self
    }

    func setupLocation() {
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startMonitoringSignificantLocationChanges()
    }

    func locationAuthCheck() {
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            currentLocation = locationManager.location

            Location.sharedInstance.latitude = currentLocation.coordinate.latitude
            Location.sharedInstance.longitude = currentLocation.coordinate.longitude

            currentWeather.downloadCurrentWeather {
                self.updateUI()
            }
        } else {
            locationManager.requestWhenInUseAuthorization()
            locationAuthCheck()
        }
    }

    func updateUI() {
        cityLabel.text = currentWeather.city
        currentTemperatureLabel.text = "\(Int(currentWeather.temperature))" + "°"
        weatherLabel.text = currentWeather.currentWeather
        currentDateLabel.text = currentWeather.date
    }
}
