//
//  DetailCityWeatherPresenter.swift
//  TestWeatherApp
//
//  Created by User on 2023-09-12.
//

import Foundation

//MARK: - Constants
private extension DetailCityWeatherPresenter {
    
    //MARK: Private
    enum Constants {
        enum ErrorMessages {
            
            //MARK: Static
            static let basicMessage = "Error fetching Detailed Weather Data:"
        }
    }
}


//MARK: - Presenter protocol
protocol DetailCityWeatherPresenterProtocol {
    func onViewDidLoad()
}


//MARK: - Main Presenter
final class DetailCityWeatherPresenter: DetailCityWeatherPresenterProtocol {
    
    //MARK: Public
    var cityWeather: CityWeather!
    weak var view: DetailCityWeatherViewControllerProtocol!
    
    
    //MARK: Initialization
    init(view: DetailCityWeatherViewControllerProtocol!, cityWeather: CityWeather!) {
        self.view = view
        self.cityWeather = cityWeather
    }
    
    //MARK: Presenter protocol
    func onViewDidLoad() {
        fetchCityWeather()
        view.setupMainUI()
    }
}


//MARK: - Main methods
private extension DetailCityWeatherPresenter {
    
    //MARK: Private
    func fetchCityWeather() {
        view.showLoadingView()
        if let cityWeather = cityWeather {
            let uiModel = DetailCityWeatherFormatter.format(cityWeather)
            view.show(with: uiModel)
            view.hideLoadingView()
        }
    }
}
