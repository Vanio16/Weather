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
    var name: String?
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
    private enum CodingKeys: String, CodingKey {
        case temp
        // swiftlint:disable:next identifier_name
        case feels_like
        // swiftlint:disable:next identifier_name
        case temp_min
        // swiftlint:disable:next identifier_name
        case temp_max
        case pressure
        case humidity
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        temp = try container.decode(Double.self, forKey: .temp)
        feelsLike = try container.decode(Double.self, forKey: .feels_like)
        tempMin = try container.decode(Double.self, forKey: .temp_min)
        tempMax = try container.decode(Double.self, forKey: .temp_max)
        pressure = try container.decode(Double.self, forKey: .pressure)
        humidity = try container.decode(Double.self, forKey: .humidity)
    }
}

final class Wind: Decodable {
    var speed: Double?
    var deg: Int?
}
