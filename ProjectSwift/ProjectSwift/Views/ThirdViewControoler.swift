//
//  ThirdViewControoler.swift
//  ProjectSwift
//
//  Created by Marina Huber on 9/26/20.
//  Copyright © 2020 Marina Huber. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    
    var dataPassed: City?

    @IBOutlet var humidityLabel: UILabel!
    @IBOutlet var weatherLabel: UILabel!
    @IBOutlet var temperatureLabel: UILabel!
    @IBOutlet var cityNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cityNameLabel.text = dataPassed?.cityName ?? ""
        temperatureLabel.text = "\(dataPassed?.cityTemperature ?? 0)°Kalvin"
        weatherLabel.text = dataPassed?.description ?? ""
        humidityLabel.text = "\(dataPassed?.humidity ?? 0)"
    }
}
