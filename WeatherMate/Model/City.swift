//
//  City.swift
//  WeatherMate
//
//  Created by Robert Lorentz on 2019-10-29.
//  Copyright © 2019 Robert Lorentz. All rights reserved.
//

import Foundation

struct City: Decodable {
    var name: String
    var country: String
    var id: Int64
}
