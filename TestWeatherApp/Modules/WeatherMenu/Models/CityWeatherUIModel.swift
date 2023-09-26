//
//  CityWeatherUIModel.swift
//  TestWeatherApp
//
//  Created by User on 2023-09-11.
//

import Foundation

//MARK: - Main UIModel
struct CityWeatherUIModel {
    let name: String!
    let temp: String!
    let weatherDescription: String!
    let highLowTemperatureDescription: String!
}


//MARK: - Cell UIModel protocol extension
extension CityWeatherUIModel: BaseCellUIModel {
    
    //MARK: Internal
    func setup(cell: CityWeatherCityTableViewCell) {
        cell.cityNameLabel.text = name
        cell.tempLabel.text = temp
        cell.lowHighTempLabel.text = highLowTemperatureDescription
        cell.weatherDescriptionLabel.text = weatherDescription
    }
}
