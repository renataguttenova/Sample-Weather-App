//
//  CurrentWeather.swift
//  SampleWeatherApp
//
//  Created by Renata Guttenová on 29/09/2019.
//  Copyright © 2019 Renata Guttenová. All rights reserved.
//

import Alamofire
import Foundation
import SwiftyJSON

class CurrentWeather {
    private var _city: String!
    private var _currentWeather: String!
    private var _temperature: Double!
    private var _date: String!

    var city: String {
        if _city == nil {
            _city = ""
        }
        return _city
    }

    var currentWeather: String {
        if _currentWeather == nil {
            _currentWeather = ""
        }
        return _currentWeather
    }

    var temperature: Double {
        if _temperature == nil {
            _temperature = 0.0
        }
        return _temperature
    }

    var date: String {
        if _date == nil {
            _date = ""
        }
        return _date
    }

    func downloadCurrentWeather(completed: @escaping downloadComplete) {
        Alamofire.request(API_URL).responseJSON { response in

            let result = response.result
            let json = JSON(result.value)

            self._city = json["name"].stringValue
            let tempDate = json["dt"].double

            let convertedDate = Date(timeIntervalSince1970: tempDate!)
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium
            dateFormatter.timeStyle = .none
            let currentDate = dateFormatter.string(from: convertedDate)
            self._date = "\(currentDate)"

            self._currentWeather = json["weather"][0]["main"].stringValue
            let downloadedTemp = json["main"]["temp"].double
            self._temperature = (downloadedTemp! - 273.15).rounded(toPlaces: 0)
            completed()
        }
    }
}
