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
    @IBOutlet private var contentBackgroundViews: [UIView]!
    @IBOutlet private weak var cityNameLabel: UILabel!
    @IBOutlet private weak var weatherDescriptionLabel: UILabel!
    @IBOutlet private weak var currentTempLabel: UILabel!
    @IBOutlet private weak var windSpeedLabel: UILabel!
    @IBOutlet private weak var cloudsPercentLabel: UILabel!
    @IBOutlet private weak var detailTempLabel: UILabel!
    @IBOutlet private weak var tempProgressView: UIProgressView!
    @IBOutlet private weak var windSpeedProgressView: UIProgressView!
    @IBOutlet private weak var cloudsPercentProgressView: UIProgressView!
    @IBOutlet private weak var footerWeatherLabel: UILabel!
    
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
        tempProgressView.progress = uiModel.tempProgress
        detailTempLabel.text = uiModel.detailTempDescription
        weatherDescriptionLabel.text = uiModel.weatherDescription
        cloudsPercentProgressView.progress = uiModel.cloudsProgress
        cloudsPercentLabel.text = uiModel.cloudsAll
        footerWeatherLabel.text = uiModel.weatherFooter
        windSpeedLabel.text = uiModel.windSpeed
    }
    
    func setupMainUI() {
        view.backgroundColor = .systemGroupedBackground
        
        for contentBackgroundView in contentBackgroundViews {
            contentBackgroundView.layer.cornerRadius = 10
            contentBackgroundView.backgroundColor = .secondarySystemGroupedBackground
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
