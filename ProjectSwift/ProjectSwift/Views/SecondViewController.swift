//
//  SecondViewController.swift
//  ProjectSwift
//
//  Created by Marina Huber on 9/26/20.
//  Copyright © 2020 Marina Huber. All rights reserved.
//

import UIKit

protocol SecondViewControllerDelegate: class {
    func citySelected(cityData: CityWeather)
}

class SecondViewController: UIViewController {
    
    @IBOutlet var textFieldCity: UITextField!
    private var citiesWeather: [City] = UserDefaults.standard.cities
    weak var delegate: SecondViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textFieldCity.text = ""
    }
    
    func searchCity (_ completion : @escaping (String) -> Void ) {
        if let city = textFieldCity?.text, city.isEmpty == false {
            completion(city)
            textFieldCity.resignFirstResponder()
        } else {
            completion("")
        }
    }
    
    @IBAction func startSearch(_ sender: UIButton) {
        searchCity {
            query in
            if query.isEmpty == false {
                APIServiceLoader.client.request(.search(matching: query), model: CityWeather.self) { result in
                    switch result {
                        case .success(let weather):
                            let forecastWeather = City(cityName: weather.name , cityTemperature: weather.main.temp, description: weather.weather.first?.description ?? "", humidity: weather.main.humidity)
                            self.citiesWeather.append(forecastWeather)
                            self.delegate?.citySelected(cityData: weather)
                            DispatchQueue.main.async {
                                self.dismiss(animated: true, completion: nil)   
                        }
                        
                        case .failure(let error):
                            print(error)
                        
                    }
                }
                
            } else { }
        }
    }
    
    @IBAction func cancelSearch(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
