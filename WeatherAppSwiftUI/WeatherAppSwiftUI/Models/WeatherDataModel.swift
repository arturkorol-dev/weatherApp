//
//  WeatherDataModel.swift
//  WeatherAppSwiftUI
//
//  Created by Artur Korol on 10.03.2022.
//

import Foundation

struct WeatherDataModel: Codable {
    let name : String
    let timezone: Int
    let main: Main
    let weather: [WeatherInfo]
    let wind: Wind
}

struct Main: Codable {
    let feels_like: Double
    let temp_min: Double
    let temp_max: Double
    let humidity: Double
}

struct WeatherInfo: Codable {
    let id: Int
    let main: String
}

struct Wind: Codable {
    let speed: Double
}
