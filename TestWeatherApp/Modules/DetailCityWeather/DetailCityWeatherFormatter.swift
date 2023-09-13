//
//  DetailCityWeatherFormatter.swift
//  TestWeatherApp
//
//  Created by User on 2023-09-12.
//

import Foundation

//MARK: - Main Formatter
final class DetailCityWeatherFormatter {
    
    //MARK: Static
    static func format(_ cityWeather: CityWeather) -> DetailCityWeatherUIModel {
        return DetailCityWeatherUIModel(name: cityWeather.name,
                                        tempProgress: Float((cityWeather.main.temp - cityWeather.main.temp_min) / (cityWeather.main.temp_max - cityWeather.main.temp_min)),
                                        tempMin: String(cityWeather.main.temp_min),
                                        tempMax: String(cityWeather.main.temp_max),
                                        cloudsAll: cityWeather.clouds.all,
                                        windSpeed: cityWeather.wind.speed,
                                        weatherDescription: cityWeather.weather.first!.main
        )
    }
}
