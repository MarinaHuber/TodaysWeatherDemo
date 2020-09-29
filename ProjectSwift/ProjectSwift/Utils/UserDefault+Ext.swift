//
//  UserDefault+Ext.swift
//  ProjectSwift
//
//  Created by Marina Huber on 9/26/20.
//  Copyright © 2020 Marina Huber. All rights reserved.
//

import Foundation

extension UserDefaults {
    private static let citiesKey = "citiesKey"

    var cities: [City] {
        get {
            let decoder = JSONDecoder()
            if let data = value(forKey: UserDefaults.citiesKey) as? Data,
                let cities = try? decoder.decode([City].self, from: data) {
                return cities
            }
            return[]
        }

        set(cities) {
            let encoder = JSONEncoder()
            if let data = try? encoder.encode(cities) {
                set(data, forKey: UserDefaults.citiesKey)
            }
        }
    }
}

