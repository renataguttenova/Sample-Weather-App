//
//  Extensions.swift
//  SampleWeatherApp
//
//  Created by Renata Guttenová on 29/09/2019.
//  Copyright © 2019 Renata Guttenová. All rights reserved.
//

import Foundation

extension Double {
    // rounds the double to decimal places value
    func rounded(toPlaces places: Int) -> Double {
        let diviser = pow(10.0, Double(places))
        return (self * diviser).rounded() / diviser
    }
}

extension Date {
    func dayOfTheWeek() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self)
    }
}
