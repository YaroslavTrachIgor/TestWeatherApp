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
                                        cloudsAll: "\(Int(cityWeather.clouds.all ?? 0))%",
                                        cloudsProgress: Float(cityWeather.clouds.all / 100),
                                        windSpeed: "\(cityWeather.wind.speed ?? 0) m/s",
                                        detailTempDescription: "H: \(String(Int(cityWeather.main.temp_min))) °F   L: \(String(Int(cityWeather.main.temp_max))) °F",
                                        weatherDescription: cityWeather.weather.first!.main,
                                        weatherFooter: "Weather for \(cityWeather.name ?? "")"
        )
    }
}
