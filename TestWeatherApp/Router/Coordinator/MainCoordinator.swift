//
//  MainCoordinator.swift
//  TestWeatherApp
//
//  Created by User on 2023-09-12.
//

import Foundation
import UIKit

//MARK: - Base Coordinator protocol
protocol Coordinator {
    var navigationController: UINavigationController { get set }
    func start()
}


//MARK: - Main Coordinator protocol
protocol MainCoordinatorProtocol: Coordinator {
    var builder: MainBuilder? { get set }
    func goToDetails(stringURL: String)
}


//MARK: - Main Coordinator
final class MainCoordinator: Coordinator {
    var builder: MainBuilder?
    var navigationController: UINavigationController
    
    
    //MARK: Initialization
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.builder = MainBuilder(coordinator: self)
    }
}


//MARK: - Main Coordinator protocol extension
extension MainCoordinator: MainCoordinatorProtocol {
    
    //MARK: Internal
    internal func start() {
        let rootVC = builder?.showList(delegate: self)
        navigationController.pushViewController(rootVC!, animated: true)
    }
    
    internal func goToDetails(stringURL: String) {
        let detailVC = builder?.goToDetail(stringURL: stringURL)
        navigationController.pushViewController(detailVC!, animated: true)
    }
}


//MARK: - GitHub Users List delegate protocol extension
extension MainCoordinator: WeatherMenuPresenterCoordinatorDelegate {
    
    //MARK: Internal
    func presenter(_ presenter: WeatherMenuPresenterProtocol, onGoToDetailed withStringURL: String?) {
        goToDetails(stringURL: withStringURL!)
    }
}
