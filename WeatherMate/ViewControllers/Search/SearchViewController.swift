//
//  MainViewController.swift
//  WeatherMate
//
//  Created by Robert Lorentz on 2019-10-28.
//  Copyright © 2019 Robert Lorentz. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    //MARK: Properties
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var autoCompleteTableView: UITableView!
    
    var cities: [City] = []
    var cityNames: [String] = []
    var autoCompleteCities: [City] = []
    
    @IBAction func searchTextFieldEditingChanged(_ sender: Any) {
        guard let searchText = searchTextField.text else { return }
        self.autoCompleteCities = getAutoCompleteCityNames(search: searchText)
        autoCompleteTableView.reloadData()
    }
    
    func getAutoCompleteCityNames(search: String) -> [City] {
        let filtered = cities.filter { (city) -> Bool in
            return city.name.lowercased().hasPrefix(search.lowercased())
        }
        return filtered
    }
    
    func loadCities() {
        if let jsonCities = Utils.readJSON(path: "current.city.list") {
            print("loaded cities json")
            self.cities = jsonCities.compactMap({ (dict) -> City? in
                if let name = dict["name"] as? String, let country = dict["country"] as? String,
                    let id = dict["id"] as? Int64 {
                    return City(name: name, country: country, id: id)
                } else {
                    return nil
                }
            })
            print("finished parsing cities")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        autoCompleteTableView.dataSource = self
        autoCompleteTableView.delegate = self
        loadCities()
    }

}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return autoCompleteCities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "Cell")
        let city = autoCompleteCities[indexPath.row]
        cell.textLabel?.text = city.name + ", " + (Utils.countryName(for: city.country) ?? "")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cityWeatherVC = CityWeatherViewController()
        cityWeatherVC.city = autoCompleteCities[indexPath.row]
        self.navigationController?.pushViewController(cityWeatherVC, animated: true)
    }
    
    
}

