//
//  WeatherViewModel.swift
//  WeatherAppSwiftUI
//
//  Created by Artur Korol on 10.03.2022.
//

import Foundation
import UIKit

class WeatherViewModel: ObservableObject {
    @Published var cityName = "Kyiv"
    @Published var imageName = "cloud.bolt"
    @Published var weatherIs = "sunny"
    @Published var tempMin = 0.0
    @Published var tempMax = 0.0
    @Published var feelsLike = 0.0
    @Published var speed = 0.0
    @Published var humidity = 0.0
    
    init() {
        fetchWeather(cityName: cityName)
    }
    
    func fetchURL() {
        
    }
    
    func fetchWeather(cityName: String) {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?appid=7513354c2c1e0e2db9a82b1143b5d3b0&units=metric&q=\(cityName)") else {return}
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {return}
            do {
                let safeData = try JSONDecoder().decode(WeatherDataModel.self, from: data)
                let weather = WeatherModel(cityName: safeData.name,
                                           conditionsID: safeData.weather[0].id,
                                           feelsLike: safeData.main.feels_like,
                                           weatherIs: safeData.weather[0].main,
                                           tempMin: safeData.main.temp_min,
                                           tempMax: safeData.main.temp_max,
                                           speed: safeData.wind.speed,
                                           humidity: safeData.main.humidity)
                DispatchQueue.main.async {
                    self.cityName = weather.cityName
                    self.imageName = weather.conditionName
                    self.tempMin = weather.tempMin
                    self.tempMax = weather.tempMax
                    self.feelsLike = weather.feelsLike
                    self.weatherIs = weather.weatherIs
                    self.speed = weather.speed
                    self.humidity = weather.humidity
                }
            } catch {
                print("Error fetching \(error)")
            }
        }
        task.resume()
    }
}
