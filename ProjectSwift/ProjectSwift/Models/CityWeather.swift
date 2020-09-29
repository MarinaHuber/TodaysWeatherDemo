//
//  CityWeather.swift
//  ProjectSwift
//
//  Created by Marina Huber on 9/23/20.
//  Copyright © 2020 Marina Huber. All rights reserved.
//

import Foundation


struct CityWeather: Codable {
    let weather: [WeatherSingle]
    let base: String
    let main: MainSingle
    let visibility: Int
    let dt: Int
    let id: Int
    var name: String
    let cod: Int

}

struct WeatherSingle: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String

}

struct MainSingle: Codable {
    let temp: Double
    let pressure: Double
    let humidity: Int

}
