//
//  CityWeather.swift
//  ProjectSwift
//
//  Created by Marina Huber on 9/23/20.
//  Copyright © 2020 Marina Huber. All rights reserved.
//

import Foundation


struct CityWeather: Codable {
    let weather: [WeatherSingle]?
    let base: String?
    let main: MainSingle?
    let visibility: Int?
    let dt: Int?
    let sys: System?
    let id: Int?
    let name: String?
    let cod: Int?

}

struct WeatherSingle: Codable {
    let id: Int?
    let main: String?
    let description: String?
    let icon: String?

}

struct System: Codable {
    let type: Int?
    let id: Int?
    let message: Double?
    let country: String?
    let sunrise: UInt64?
    let sunset: UInt64?
}

struct MainSingle: Codable {

    let temp: Double?
    let pressure: Double?
    let humidity: Int?
    let temp_max: Double?
    let temp_min: Double?

}
