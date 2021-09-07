//
//  GeoNetworkService.swift
//  Weather
//
//  Created by Ivan Zakharov on 6/9/21.
//

import Foundation

class GeoNetworkService {
    private let token = "16cb8613652bb722f03ed6c75de7dc84"

    func getWeather(lat: Double, lon: Double, completion: @escaping (Result<WeatherModel, Error>) -> Void) {
        let urlString = "http://api.openweathermap.org/data/2.5/weather?lat=\(lat)&lon=\(lon)&units=metric&lang=ru&appid=\(token)"
        guard let url = URL(string: urlString) else {
            return
        }
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            DispatchQueue.main.async {
                if let error = error {
                    completion(.failure(error))
                    return
                }
                guard let data = data else {
                    return
                }
                do {
                    let weather = try JSONDecoder().decode(WeatherModel.self, from: data)
                    completion(.success(weather))
                }
                catch let jsonError {
                    completion(.failure(jsonError))
                }
            }
        }.resume()
    }
}
