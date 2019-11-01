//
//  Utils.swift
//  Weather
//
//  Created by Robert Lorentz on 2019-10-28.
//  Copyright © 2019 Robert Lorentz. All rights reserved.
//

import Foundation
import UIKit

class Utils {
    
    static func readJSON(path: String) -> [Dictionary<String, Any>]? {
        if let path = Bundle.main.path(forResource: path, ofType: "json") {
            do {
                  let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                  let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                  if let jsonResult = jsonResult as? [Dictionary<String, Any>] {
                     return jsonResult
                  }
              } catch {
                   // handle error
              }
        } else {
            print("Wrong path")
        }
        print("unable to parse JSON")
        return nil
    }
    
    static func isSameDay(date1: Date, date2: Date) -> Bool {
        return Calendar.current.isDate(date1, inSameDayAs: date2)
    }
    
    static func getWeekday(for date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "sv")
        dateFormatter.dateFormat = "EEEE"
        let weekDay = dateFormatter.string(from: date)
        return weekDay
    }
    
    static func countryName(for countryCode: String) -> String? {
        if let name = (Locale.current as NSLocale).displayName(forKey: .countryCode, value: countryCode) {
            // Country name was found
            return name
        } else {
            // Country name cannot be found
            return nil
        }
    }
}
