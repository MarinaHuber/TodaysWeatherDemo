//
//  APIEndpoints.swift
//  ProjectSwift
//
//  Created by Marina Huber on 9/24/20.
//  Copyright © 2020 Marina Huber. All rights reserved.

import Foundation

struct Endpoint {
    let path: String
    let queryItems: [URLQueryItem]
}

extension Endpoint {
    static func search(matching query: String) -> Endpoint {
        return Endpoint(
            path: "/data/2.5/weather",
            queryItems: [
                URLQueryItem(name: "q", value: query),
                URLQueryItem(name: "units", value: "metric"),
                URLQueryItem(name: "appid", value: Keys.publicKey)
            ]
        )
    }
}
extension Endpoint {
    var url: URL? {
        var components        = URLComponents()
        components.scheme     = "https"
        components.host       = "api.openweathermap.org"
        components.path       = path
        components.queryItems = queryItems
        print(components.url?.absoluteString ?? "")

        return components.url
    }
}
