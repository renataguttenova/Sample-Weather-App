//
//  ForecastWeather.swift
//  SampleWeatherApp
//
//  Created by Renata Guttenová on 29/09/2019.
//  Copyright © 2019 Renata Guttenová. All rights reserved.
//

import Foundation

class ForecastWeather {
    private var _day: String!
    private var _temperature: Double!
    private var _date: String!

    var day: String {
        if _day == nil {
            _day = ""
        }
        return _day
    }

    var temperature: Double {
        if _temperature == nil {
            _temperature = 0.0
        }
        return _temperature
    }

    init(weatherDictionary: Dictionary<String, AnyObject>) {
        if let temperature = weatherDictionary["main"] as? Dictionary<String, AnyObject> {
            if let dayTemperature = temperature["temp"] as? Double {
                let rawValue = (dayTemperature - 273.15).rounded(toPlaces: 0)
                _temperature = rawValue
            }
        }

        if let day = weatherDictionary["dt"] as? Double {
            let rawDate = Date(timeIntervalSince1970: day)
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium

            _day = "\(rawDate.dayOfTheWeek())"
        }
    }
}
