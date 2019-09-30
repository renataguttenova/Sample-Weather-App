//
//  Location.swift
//  SampleWeatherApp
//
//  Created by Renata Guttenová on 29/09/2019.
//  Copyright © 2019 Renata Guttenová. All rights reserved.
//

import Foundation

class Location {
    static var sharedInstance = Location()

    var longitude: Double!
    var latitude: Double!
}
