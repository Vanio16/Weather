//
//  Weather.swift
//  Weather
//
//  Created by Ivan Zakharov on 3/9/21.
//

import Foundation

final class WeatherModel: Decodable {
    var weather: [Weather?]
    var main: Main?
    var wind: Wind?
}

final class Coord: Decodable {
    var lon: Double?
    var lat: Double?
}

final class Weather: Decodable {
    var id: Int?
    var main: String?
    var description: String?
    var icon: String?
}

final class Main: Decodable {
    var temp: Double?
    var feelsLike: Double?
    var tempMin: Double?
    var tempMax: Double?
    var pressure: Double?
    var humidity: Double?
}

final class Wind: Decodable {
    var speed: Double?
    var deg: Int?
}
