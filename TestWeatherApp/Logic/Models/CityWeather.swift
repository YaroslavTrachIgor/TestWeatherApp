//
//  CityWeather.swift
//  TestWeatherApp
//
//  Created by User on 2023-09-11.
//

import Foundation

//MARK: - Main Model
final class CityWeather: Decodable {
    var weather: [Weather]!
    var main: MainWeather!
    var name: String!
    var wind: Wind!
    var clouds: Clouds!
    
    init(weather: [Weather]!, main: MainWeather!, name: String!, wind: Wind!, clouds: Clouds!) {
        self.weather = weather
        self.main = main
        self.name = name
        self.wind = wind
        self.clouds = clouds
    }
}

final class Clouds: Decodable {
    var all: Double!
    
    init(all: Double!) {
        self.all = all
    }
}

final class Wind: Decodable {
    var speed: Double!
    var deg: Double!
    
    init(speed: Double!, deg: Double!) {
        self.speed = speed
        self.deg = deg
    }
}

final class Weather: Decodable {
    var id: Int!
    var main: String!
    var description: String!
    var icon: String!
    
    init(id: Int!, main: String!, description: String!, icon: String!) {
        self.id = id
        self.main = main
        self.description = description
        self.icon = icon
    }
}

final class MainWeather: Decodable {
    var temp: Double!
    var feels_like: Double!
    var temp_min: Double!
    var temp_max: Double!
    
    init(temp: Double!, feels_like: Double!, temp_min: Double!, temp_max: Double!) {
        self.temp = temp
        self.feels_like = feels_like
        self.temp_min = temp_min
        self.temp_max = temp_max
    }
}
