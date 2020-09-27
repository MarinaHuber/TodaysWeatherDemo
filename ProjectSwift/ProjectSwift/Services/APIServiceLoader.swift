//
//  APIService.swift
//  ProjectSwift
//
//  Created by Marina Huber on 9/23/20.
//  Copyright © 2020 Marina Huber. All rights reserved.
//

import Foundation


struct APIService {
    
   // static let shared   = APIService()
//    let x = 0
//    let y = 0
//    private init(_ param1:(Int), param2: (Int)) {
//        self.x = param1
//        self.y = param2
//    }
    
    func request<T: Decodable>(_ search: String, _ endpoint: APIEndpoints, model: T.Type, parameters:[String: String], completion: @escaping (Result<T, Error>) -> ()) {
        var components = URLComponents()
        components.scheme = endpoint.scheme
        components.host = endpoint.host
        components.path = endpoint.path
        components.queryItems = endpoint.queryItems
        print(components.url?.absoluteString)
        
        let request = URLRequest(url: components.url!)
        guard let url1 = components.url else {
            return
        }
        let urlString = String("\(Keys.base_URL)?q=" + (search.replacingOccurrences(of: " ", with: "%20")) + "&units=metric&appid=\(Keys.publicKey)")
        guard let url = URL(string: urlString) else { return }
        
        let session = URLSession(configuration: .default)
        session.dataTask(with: request, completionHandler: { data, response, error in
            guard error == nil else {
                completion(.failure(APIServiceError.responseError))
                return
            }
            guard let data = data else { return }
            do {
                let httpResponse = response as? HTTPURLResponse
                if httpResponse?.statusCode != 200 {
                    assert(false, "statusCode should be 200, but is \(String(describing: httpResponse?.statusCode))")
                }
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                let responseObject = try decoder.decode(T.self, from: data)
                
                DispatchQueue.main.async {
                    completion(.success(responseObject))
                }
            } catch let error {
                completion(.failure(error))
            }
        }).resume()
    }

}
