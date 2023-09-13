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
                temp: cityWeather.main.temp,
                weatherDescription: cityWeather.weather.first?.main
            )
        }
    }
}
