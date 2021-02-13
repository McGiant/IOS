//
//  Weather.swift
//  WeatherApp
//
//  Created by Tapiwa Konga on 13/2/2021.
//  Copyright © 2021 Tapiwa Konga. All rights reserved.
//
// this is our model

import Foundation

public struct Weather{
    let city: String
    let temperature: String
    let description: String
    let iconName: String
    
    init(response: APIResponse) {
        city = response.name
        temperature = "\(response.main.temp)"
        description = response.weather.first?.description ?? ""
        iconName = response.weather.first?.iconName ?? ""
    }
}
