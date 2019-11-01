//
//  CityWeatherViewController.swift
//  WeatherMate
//
//  Created by Robert Lorentz on 2019-10-29.
//  Copyright © 2019 Robert Lorentz. All rights reserved.
//

import UIKit

class CityWeatherViewController: UIViewController {
    
    //MARK: Properties
    
    @IBOutlet weak var currentCityLabel: UILabel!
    @IBOutlet weak var currentWeatherDescriptionLabel: UILabel!
    @IBOutlet weak var currentTemperatureLabel: UILabel!
    @IBOutlet weak var currentWeekDayLabel: UILabel!
    @IBOutlet weak var currentDayLabel: UILabel!
    @IBOutlet weak var weatherTableView: UITableView!
    
    //MARK: Actions
    @IBAction func nextDayAction(_ sender: Any) {
        let modifiedDate = Calendar.current.date(byAdding: .day, value: 1, to: currentDate)!
        changeDay(date: modifiedDate)
    }
    @IBAction func previousDayAction(_ sender: Any) {
        let modifiedDate = Calendar.current.date(byAdding: .day, value: -1, to: currentDate)!
        changeDay(date: modifiedDate)
    }
    
    func changeDay(date: Date) {
        currentDate = date
        currentDayLabel.text = df.string(from: date)
        currentWeekDayLabel.text = Utils.getWeekday(for: date)
        self.todayForecasts = self.getForecastsForDate(forecasts: forecasts, date: self.currentDate)
        self.weatherTableView.reloadData()
    }
    
    var currentWeather: Weather!
    var forecasts: [Forecast] = []
    var currentDate: Date = Date()
    var todayForecasts: [Forecast] = []
    let df = DateFormatter()
    
    var city: City! {
        didSet {
            initializeValues(city: city)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        df.dateFormat = "yyyy-MM-dd"
        currentDayLabel.text = df.string(from: Date())
        currentWeekDayLabel.text = Utils.getWeekday(for: Date())
        weatherTableView.register(UINib(nibName: "WeatherTableViewCell", bundle: nil), forCellReuseIdentifier: "WeatherTableViewCell")
        currentCityLabel.text = city?.name
        weatherTableView.dataSource = self
        weatherTableView.delegate = self
    }
    
    func initializeValues(city: City) {
        _ = OpenWeatherMapAPI.getCurrentWeather(id: String(city.id)).done { (weather) in
            self.currentWeather = weather
            self.currentTemperatureLabel.text = String(Int(weather.temp)) + "°C"
            self.currentWeatherDescriptionLabel.text = weather.description
        }
        _ = OpenWeatherMapAPI.getWeatherForecasts(id: String(city.id)).done { (forecasts) in
            self.forecasts = forecasts
            self.todayForecasts = self.getForecastsForDate(forecasts: forecasts, date: self.currentDate)
            self.weatherTableView.reloadData()
        }
    }
    
    func getForecastsForDate(forecasts: [Forecast], date: Date) -> [Forecast] {
        return forecasts.filter { (forecast) -> Bool in
            
            return Utils.isSameDay(date1: date, date2: forecast.date)
        }
    }
}

extension CityWeatherViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todayForecasts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherTableViewCell", for: indexPath) as! WeatherTableViewCell
        let forecast = todayForecasts[indexPath.row]
        return mapForecastToWeatherCell(forecast: forecast, weatherCell: cell)
    }
    
    func mapForecastToWeatherCell(forecast: Forecast, weatherCell: WeatherTableViewCell) -> WeatherTableViewCell {
        let df = DateFormatter()
        df.dateFormat = "HH:mm"
        df.timeZone = TimeZone(abbreviation: "UTC")

        weatherCell.time.text = df.string(from: forecast.date)
        weatherCell.temp.text = String(Int(forecast.weather.temp)) + " °C"
        switch forecast.weather.type {
        case "Clouds":
            weatherCell.weatherIconLabel.text = WeatherIcon.OvercastClouds.iconUnicode
        case "Rain":
            weatherCell.weatherIconLabel.text = WeatherIcon.ShowerRain.iconUnicode
        case "Snow":
            weatherCell.weatherIconLabel.text = WeatherIcon.Snow.iconUnicode
        case "Clear":
            weatherCell.weatherIconLabel.text = WeatherIcon.ClearSky.iconUnicode
        default:
            print("unable to parse weathericon")
            weatherCell.weatherIconLabel.text = ""
        }
        return weatherCell
    }
}
