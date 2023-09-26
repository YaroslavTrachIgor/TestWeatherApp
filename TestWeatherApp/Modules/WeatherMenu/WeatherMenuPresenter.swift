//
//  WeatherMenuPresenter.swift
//  TestWeatherApp
//
//  Created by User on 2023-09-11.
//

import Foundation
import UIKit

//MARK: - Presenter protocol
protocol WeatherMenuPresenterProtocol {
    func onViewDidLoad()
    func addNewCityWeather(_ cityName: String)
    func deleteCityWeather(_ cityWeather: CityWeatherUIModel)
    func onDidSelect(row: Int)
}


//MARK: - Presenter Coordinator delegate protocol
protocol WeatherMenuPresenterCoordinatorDelegate {
    func presenter(_ presenter: WeatherMenuPresenterProtocol, onGoToDetailed withStringURL: String?)
}


//MARK: - Constants
private extension WeatherMenuPresenter {
    
    //MARK: Private
    enum Constants {
        enum ErrorMessages {
            
            //MARK: Static
            static let basicMessage = "Error fetching Menu Weather Data:"
        }
        enum UserDefaults {
            
            //MARK: Static
            static let citiesWeatherStringURLsKey = "FavouriteImagesDataKey"
        }
        enum URL {
            
            //MARK: Static
            static let basicCitiesURLs = [
                String(URLs.WeatherCities.host + "London" + URLs.WeatherCities.query),
                String(URLs.WeatherCities.host + "Washington" + URLs.WeatherCities.query)
            ]
        }
    }
}


//MARK: - Main Presenter
final class WeatherMenuPresenter {
    
    //MARK: Private
    @UserDefault(Constants.UserDefaults.citiesWeatherStringURLsKey, defaultValue: Constants.URL.basicCitiesURLs)
    private var stringUrls: [String]
    private var citiesWeather: [CityWeather] = []
    private var delegate: WeatherMenuPresenterCoordinatorDelegate?
    private weak var view: WeatherMenuTableViewControllerProtocol!
    
    
    //MARK: Initialization
    init(view: WeatherMenuTableViewControllerProtocol!,
         delegate: WeatherMenuPresenterCoordinatorDelegate!) {
        self.view = view
        self.delegate = delegate
    }
}


//MARK: - Presenter protocol extension
extension WeatherMenuPresenter: WeatherMenuPresenterProtocol {
    
    //MARK: Internal
    func onViewDidLoad() {
        view.setupMainUI()
        fetchCitiesWeather()
    }
    
    func addNewCityWeather(_ cityName: String) {
        let cityQuery = cityName.toCityAPIPath()
        let stringURL = URLs.WeatherCities.host + cityQuery + URLs.WeatherCities.query
        if !stringUrls.contains(stringURL) {
            stringUrls.insert(stringURL, at: 0)
            fetchCitiesWeather()
        }
    }
    
    func deleteCityWeather(_ uiModel: CityWeatherUIModel) {
        if let index = stringUrls.firstIndex(where: { $0.contains(uiModel.name.toCityAPIPath()) }) {
            stringUrls.remove(at: index)
            fetchCitiesWeather()
        }
    }
    
    func onDidSelect(row: Int) {
        let stringURL = stringUrls[row]
        delegate?.presenter(self, onGoToDetailed: stringURL)
    }
}

//MARK: - Main methods
private extension WeatherMenuPresenter {
    
    //MARK: Private
    func fetchCitiesWeather() {
        view.showLoadingView()
        citiesWeather = []
        for i in stringUrls {
            print(i)
        }
        Task {
            await stringUrls.concurrentForEach({ stringUrl in
                let apiClient = WeatherMenuAPIClient(url: URL(string: stringUrl)!)
                do {
                    if let cityWeather = try await apiClient.getCityWeather() {
                        self.citiesWeather.append(cityWeather)
                    }
                } catch {
                    print(Constants.ErrorMessages.basicMessage)
                    print(error)
                }
            })
            DispatchQueue.main.async { [self] in
                let uiModels = WeatherMenuFormatter.format(citiesWeather)
                view.updateRows(uiModels)
                view.reloadTableView()
                view.hideLoadingView()
            }
        }
    }
}
