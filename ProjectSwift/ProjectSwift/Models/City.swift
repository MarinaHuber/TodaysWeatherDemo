//
//  City.swift
//  ProjectSwift
//
//  Created by Marina Huber on 9/28/20.
//  Copyright © 2020 Marina Huber. All rights reserved.
//

import Foundation

struct City: Codable {
    var cityName: String
    var cityTemperature: Double
    var description: String
    var humidity: Int

    init(cityName: String, cityTemperature: Double, description: String, humidity: Int) {
        self.cityName = cityName
        self.cityTemperature = cityTemperature
        self.description = description
        self.humidity = humidity
    }

}
