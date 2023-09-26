//
//  WeatherMenuFormatter.swift
//  TestWeatherApp
//
//  Created by User on 2023-09-11.
//

import Foundation

//MARK: - Main Formatter
final class WeatherMenuFormatter {
    
    //MARK: Static
    static func format(_ citiesWeather: [CityWeather]) -> [CityWeatherUIModel] {
        return citiesWeather.compactMap { cityWeather in
            CityWeatherUIModel(
                name: cityWeather.name,
                temp: "\(Int(cityWeather.main.temp ?? 0))°F",
                weatherDescription: cityWeather.weather.first?.main,
                highLowTemperatureDescription: "H: \(Int(cityWeather.main.temp_max ?? 0))°F L: \(Int(cityWeather.main.temp_min ?? 0))°F"
            )
        }
    }
}
