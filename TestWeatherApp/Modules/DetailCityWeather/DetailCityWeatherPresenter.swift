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
    var stringURL: String!
    weak var view: DetailCityWeatherViewControllerProtocol!
    
    
    //MARK: Initialization
    init(view: DetailCityWeatherViewControllerProtocol!, stringURL: String!) {
        self.view = view
        self.stringURL = stringURL
    }
    
    //MARK: Presenter protocol
    func onViewDidLoad() {
        fetchCitiesWeather()
        view.setupMainUI()
    }
}


//MARK: - Main methods
private extension DetailCityWeatherPresenter {
    
    //MARK: Private
    func fetchCitiesWeather() {
        view.showLoadingView()
        Task {
            let apiClient = WeatherMenuAPIClient(url: URL(string: stringURL)!)
            do {
                if let cityWeather = try await apiClient.getCityWeather() {
                    DispatchQueue.main.async { [self] in
                        let uiModel = DetailCityWeatherFormatter.format(cityWeather)
                        view.show(with: uiModel)
                        view.hideLoadingView()
                    }
                }
            } catch {
                print(Constants.ErrorMessages.basicMessage)
                print(error)
            }
        }
    }
}
