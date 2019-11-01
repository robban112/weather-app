//
//  OpenWeatherMapAPI.swift
//  WeatherMate
//
//  Created by Robert Lorentz on 2019-10-29.
//  Copyright © 2019 Robert Lorentz. All rights reserved.
//

import Foundation
import Alamofire
import PromiseKit

class OpenWeatherMapAPI {
    
    static let APPID = Constants.APPID
    
    static func getCurrentWeather(id: String) -> Promise<Weather> {
        let strURL = "http://api.openweathermap.org/data/2.5/weather"
        let params = ["id" : id, "APPID" : APPID]
        
        return Promise { promise in
            AF.request(strURL, method: .get, parameters: params, encoder: URLEncodedFormParameterEncoder.default, headers: nil, interceptor: nil).responseJSON { (responseObject) in
                if let val = responseObject.value as? Dictionary<String,Any> {
                    if let weather = mapToWeather(weatherDict: val) {
                        promise.fulfill(weather)
                    }
                } else {
                    promise.reject(responseObject.error!)
                }
            }
        }
    }
    
    static func mapToWeather(weatherDict: Dictionary<String, Any>) -> Weather? {
        if let mainWeather = weatherDict["weather"] as? [Dictionary<String, Any>],
        let weatherType = mainWeather[0]["main"] as? String,
        let description = mainWeather[0]["description"] as? String,
        let main = weatherDict["main"] as? Dictionary<String, Any>,
        let temp = main["temp"] as? Double
        {
            let celsiusTemp = temp - 273.15
            let weather = Weather(temp: celsiusTemp, type: weatherType, description: description)
            return weather
        }
        return nil
    }
    
    static func getWeatherForecasts(id: String) -> Promise<[Forecast]> {
        let strURL = "http://api.openweathermap.org/data/2.5/forecast"
        let params = ["id" : id, "APPID" : APPID]
        return Promise { promise in
            AF.request(strURL, method: .get, parameters: params, encoder: URLEncodedFormParameterEncoder.default, headers: nil, interceptor: nil).responseJSON { (responseObject) in
                if let val = responseObject.value as? Dictionary<String,Any>, let weatherTimeList = val["list"] as? [Dictionary<String,Any>] {
                    let forecasts = mapToForecasts(weatherTimeList: weatherTimeList)
                    promise.fulfill(forecasts)
                } else {
                    promise.reject(responseObject.error!)
                }
            }
        }
    }
    
    static func mapToForecasts(weatherTimeList: [Dictionary<String, Any>]) -> [Forecast] {
        var forecasts: [Forecast] = []
        for weatherTime in weatherTimeList {
            if let dt = weatherTime["dt"] as? NSNumber, let main = weatherTime["main"] as? Dictionary<String,Any>,
            let temp = main["temp"] as? Double,
            let weatherDict = weatherTime["weather"] as? [Dictionary<String, Any>],
            let weatherType = weatherDict[0]["main"] as? String,
            let description = weatherDict[0]["description"] as? String {
                
                let date = Date(timeIntervalSince1970: TimeInterval(exactly: dt)!)
                let celsiusTemp = temp - 273.15
                let weather = Weather(temp: celsiusTemp, type: weatherType, description: description)
                let forecast = Forecast(date: date, weather: weather)
                forecasts.append(forecast)
            }
        }
        return forecasts
    }
}
