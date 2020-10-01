//
//  FirstViewController.swift
//  ProjectSwift
//
//  Created by Marina Huber on 9/23/20.
//  Copyright © 2020 Marina Huber. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    @IBOutlet var cityTableView: UITableView!
    var refreshControl: UIRefreshControl!
    private var citiesWeather: [City] = UserDefaults.standard.cities
    var data: CityWeather?
    var cityToPass: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        cityTableView.refreshControl = refreshControl
    }
    
    @objc func refresh(_ sender: AnyObject) {
        self.cityTableView.reloadData()
        self.refreshControl?.endRefreshing()
    }
    
    
    @IBAction func addCity(_ sender: UIButton) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Second", bundle: nil)
        let controller = storyboard.instantiateViewController(identifier: "second") as SecondViewController
        controller.delegate = self
        navigationController?.present(controller, animated: true, completion: nil)
    }
}
    
extension FirstViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if citiesWeather.isEmpty == true {
            return 1
        } else {
            return citiesWeather.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row > citiesWeather.count { return }
        let cell = UITableViewCell()
        if citiesWeather.isEmpty == true {
            cell.textLabel?.text = "No city added"
        } else {
            let cellData = self.citiesWeather[indexPath.row]
            cell.textLabel?.text = cellData.cityName
        }
        return cell
    }
    
}

extension FirstViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selected = cityTableView.indexPathForSelectedRow?.row
        let storyboard = UIStoryboard(name: "Third", bundle: nil)
        let detail: ThirdViewController = storyboard.instantiateViewController(withIdentifier: "third") as! ThirdViewController
        detail.dataPassed = citiesWeather[selected!]
        navigationController?.pushViewController(detail, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard editingStyle == .delete else { return }
        
        self.citiesWeather.remove(at: indexPath.row)
        cityTableView.deleteRows(at: [indexPath], with: .left)
    }
}


extension FirstViewController: SecondViewControllerDelegate {
    
    func citySelected(cityData: CityWeather) {
        let forecastWeather = City(cityName: cityData.name, cityTemperature: cityData.main.temp, description: cityData.weather.first?.description ?? "", humidity: cityData.main.humidity)
        citiesWeather.append(forecastWeather)
        DispatchQueue.main.async {
            self.cityTableView.reloadData()
            self.cityTableView.reloadSections(IndexSet(integer: 0), with: .fade)
        }
        UserDefaults.standard.cities = citiesWeather
    }
}


