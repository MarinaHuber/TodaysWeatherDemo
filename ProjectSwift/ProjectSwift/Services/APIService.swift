//
//  APIService.swift
//  ProjectSwift
//
//  Created by Marina Huber on 9/23/20.
//  Copyright © 2020 Marina Huber. All rights reserved.
//

import Foundation


enum APIRouter {

    static let APIKey: String = "c6e381d8c7ff98f0fee43775817cf6ad"
    static let base_URL = "https://api.openweathermap.org/data/2.5/"
}

class APIService {
    public static func getCityToday(_ city: String, completion: @escaping (Result<[CityWeather], APIServiceError>) -> Void) {
        let urlString = String("\(APIRouter.base_URL)/weather?q=" + (city.replacingOccurrences(of: " ", with: "%20")) + "&units=metric&appid=\(APIRouter.APIKey)")
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, _, err) in
            if let error = err {
                print("Task error:", error.localizedDescription)
                return
            }
            guard let data = data else { return }
            do {
               
            } catch let error {
 

            }
            }.resume()
    }

}
