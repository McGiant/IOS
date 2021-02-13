//
//  ContentView.swift
//  WeatherApp
//
//  Created by Tapiwa Konga on 13/2/2021.
//  Copyright © 2021 Tapiwa Konga. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel: WeatherViewModel
    var body: some View {
        VStack{
            Text(viewModel.cityName)
                .font(.largeTitle)
            .padding()
            Text(viewModel.temperature)
                .font(.system(size: 70))
            .bold()
            Text(viewModel.weatherIcon)
                .font(.largeTitle)
            .padding()
            Text(viewModel.weatherDescription)
        }.onAppear(perform: viewModel.refresh)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: WeatherViewModel(weatherService: WeatherService()))
    }
}
