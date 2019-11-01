//
//  Weather.swift
//  WeatherMate
//
//  Created by Robert Lorentz on 2019-10-29.
//  Copyright © 2019 Robert Lorentz. All rights reserved.
//

import Foundation

struct Forecast {
    var date: Date
    var weather: Weather
}

struct Weather {
    var temp: Double
    var type: String
    var description: String
}
