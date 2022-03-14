//
//  WeatherModel.swift
//  WeatherAppSwiftUI
//
//  Created by Artur Korol on 10.03.2022.
//

import Foundation

struct WeatherModel {
    
    let cityName: String
    let conditionsID: Int
    let feelsLike: Double
    let weatherIs: String
    let tempMin: Double
    let tempMax: Double
    let speed: Double
    let humidity: Double
    
    
    var conditionName: String {
        switch conditionsID {
        case 200...232:
            return "cloud.bolt"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.snow"
        case 700...781:
            return "cloud.fog"
        case 800:
            return "sun.max"
        case 801...804:
            return "cloud.bolt"
        default:
            return "cloud"
        }
    }
}
