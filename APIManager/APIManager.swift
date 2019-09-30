//
//  APIManager.swift
//  SampleWeatherApp
//
//  Created by Renata Guttenová on 29/09/2019.
//  Copyright © 2019 Renata Guttenová. All rights reserved.
//

import Foundation

// swiftlint:disable:next identifier_name
let API_URL = "https://api.openweathermap.org/data/2.5/weather?lat=\(Location.sharedInstance.latitude!)&lon=\(Location.sharedInstance.longitude!)&appid=1045d8be61103660466df26e7ded58c1"
// swiftlint:disable:next identifier_name
let FORECAST_API_URL = "https://api.openweathermap.org/data/2.5/forecast?lat=\(Location.sharedInstance.latitude!)&lon=\(Location.sharedInstance.longitude!)&appid=1045d8be61103660466df26e7ded58c1"

// completion handler
// swiftlint:disable type_name
typealias downloadComplete = () -> Void
