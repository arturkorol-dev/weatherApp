//
//  WeatherView.swift
//  WeatherAppSwiftUI
//
//  Created by Artur Korol on 10.03.2022.
//

import SwiftUI

struct WeatherView: View {
    @State private var cityName: String = ""
    @StateObject var viewModel = WeatherViewModel()
    
    var body: some View {
        ZStack(alignment: .leading){
            VStack {
                VStack(alignment: .leading, spacing: 5) {
                    TextField("Enter city name", text: $cityName) {
                        viewModel.fetchWeather(cityName: cityName)
                    }
                    .frame(width: 360, height: 30)
                    
                    Text(viewModel.cityName)
                        .bold()
                        .font(.title)
                    Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                        .fontWeight(.light)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                VStack {
                    HStack {
                        VStack(spacing: 20) {
                            Image(systemName: viewModel.imageName)
                                .font(.system(size: 80))
                            Text(viewModel.weatherIs)
                        }
                        .frame(width: 150, alignment: .leading)
                        
                        Spacer()
                        
                        Text(viewModel.feelsLike.roundDouble() + "°")
                            .font(.system(size: 80))
                            .fontWeight(.bold)
                            .padding()
                    }
                    
                    Spacer()
                        
                }
                .frame(maxWidth: .infinity)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack {
                Spacer()
                
                VStack(alignment: .leading, spacing: 20) {
                    Text("Weather now")
                        .bold()
                        .padding()
                    
                    HStack {
                        WeatherRow(logo: "thermometer", name: "Min temp", value: viewModel.tempMin.roundDouble() + "°")
                            .padding(.leading)
                        
                        Spacer()
                        
                        WeatherRow(logo: "thermometer", name: "Max temp", value: viewModel.tempMax.roundDouble() + "°")
                            .padding(.trailing)
                    }
                    
                    HStack {
                        WeatherRow(logo: "wind", name: "Wind speed", value: "\(viewModel.speed) m/s")
                            .padding(.leading)
                        
                        Spacer()
                        
                        WeatherRow(logo: "humidity", name: "Humidity", value: "\(viewModel.humidity)%")
                    }
                    .padding(.trailing)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 20)
                .background(.white)
                .cornerRadius(20, corners: [.topRight, .topLeft])
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Image("background_image")
                        .resizable()
                        .ignoresSafeArea())
        .preferredColorScheme(.light)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}
