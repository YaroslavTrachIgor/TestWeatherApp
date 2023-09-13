//
//  DetailCityWeatherViewController.swift
//  TestWeatherApp
//
//  Created by User on 2023-09-12.
//

import UIKit

//MARK: - ViewController protocol
protocol DetailCityWeatherViewControllerProtocol: AnyObject {
    func show(with uiModel: DetailCityWeatherUIModel)
    func setupMainUI()
    func showLoadingView()
    func hideLoadingView()
}


//MARK: - Main ViewController
final class DetailCityWeatherViewController: UIViewController {

    //MARK: Public
    var presenter: DetailCityWeatherPresenterProtocol?
    
    //MARK: Private
    private var loadingView: LoadingView?
    
    //MARK: @IBOutlets
    @IBOutlet private weak var cityNameLabel: UILabel!
    @IBOutlet private weak var weatherDescriptionLabel: UILabel!
    @IBOutlet private weak var weatherDetailsSegmentedControl: UISegmentedControl!
    @IBOutlet private weak var weatherDetailsLabel: UILabel!
    @IBOutlet private weak var tempProgressView: UIProgressView!
    @IBOutlet private weak var minTempLabel: UILabel!
    @IBOutlet private weak var maxTempLabel: UILabel!
    
    
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter?.onViewDidLoad()
    }
}


//MARK: - ViewController protocol extension
extension DetailCityWeatherViewController: DetailCityWeatherViewControllerProtocol {
    
    //MARK: Internal
    func show(with uiModel: DetailCityWeatherUIModel) {
        cityNameLabel.text = uiModel.name
        minTempLabel.text = uiModel.tempMin
        maxTempLabel.text = uiModel.tempMax
        tempProgressView.progress = uiModel.tempProgress
        weatherDescriptionLabel.text = uiModel.weatherDescription
    }
    
    func setupMainUI() {
        if tempProgressView.progress > 0.5 {
            tempProgressView.tintColor = .systemRed
        } else {
            tempProgressView.tintColor = .systemBlue
        }
    }
    
    func showLoadingView() {
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseIn) { [self] in
            loadingView = LoadingView(frame: view.bounds)
            view.addSubview(loadingView!)
            loadingView?.startAnimating()
        }
    }
    
    func hideLoadingView() {
        loadingView?.stopAnimating()
        loadingView?.removeFromSuperview()
        loadingView = nil
    }
}
