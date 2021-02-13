//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Tapiwa Konga on 13/2/2021.
//  Copyright © 2021 Tapiwa Konga. All rights reserved.
//

import Foundation

private let defaultIcon = "❓"
private let iconMap = [
    "Drizzle" : "🌧",
    "Thunderstorm" : "⛈",
    "Rain" : "🌨",
    "Snow" : "❄️",
    "Clear" : "☀️",
    "Clouds" : "☁️",
]

public class WeatherViewModel: ObservableObject{
    @Published var cityName: String = "City Name"
    @Published var temperature: String = "___"
    @Published var weatherDescription: String = "___"
    @Published var weatherIcon: String = defaultIcon
    
    public let weatherService: WeatherService
    
    public init(weatherService: WeatherService){
        self.weatherService = weatherService
    }
    
    public func refresh(){
        weatherService.loadWeatherDAta{weather in DispatchQueue.main.async{
            self.cityName = weather.city
            self.temperature = "\(weather.temperature)°C"
            self.weatherDescription = weather.description.capitalized
            self.weatherIcon = iconMap[weather.iconName] ?? defaultIcon
            
            }
        }
    }
}
