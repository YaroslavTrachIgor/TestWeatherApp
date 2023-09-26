//
//  MainBuilder.swift
//  TestWeatherApp
//
//  Created by User on 2023-09-12.
//

import Foundation
import UIKit

//MARK: - Main Bulder protocol
protocol Builder {
    init(coordinator: MainCoordinator!)
    func showList(delegate: WeatherMenuPresenterCoordinatorDelegate) -> UIViewController
    func goToDetail(stringURL: String) -> UIViewController
}


//MARK: - Main Bulder
final class MainBuilder {
    
    //MARK: Weak
    weak var coordinator: MainCoordinator!
    
    //MARK: Initialization
    init(coordinator: MainCoordinator!) {
        self.coordinator = coordinator
    }
}


//MARK: - Builder protocol extension
extension MainBuilder: Builder {
    
    //MARK: Internal
    internal func showList(delegate: WeatherMenuPresenterCoordinatorDelegate) -> UIViewController {
        let rootVCNibName = String(describing: WeatherMenuTableViewController.self)
        let rootVC = WeatherMenuTableViewController(nibName: rootVCNibName, bundle: nil)
        rootVC.presenter = WeatherMenuPresenter(view: rootVC, delegate: delegate)
        return rootVC
    }
    
    internal func goToDetail(stringURL: String) -> UIViewController {
        let rootVC = DetailCityWeatherViewController()
        let presenter = DetailCityWeatherPresenter(view: rootVC, stringURL: stringURL)
        rootVC.presenter = presenter
        return rootVC
    }
}

