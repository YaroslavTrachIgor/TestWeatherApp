//
//  WeatherMenuTableViewController.swift
//  TestWeatherApp
//
//  Created by User on 2023-09-11.
//

import UIKit

//MARK: - Constants
private extension WeatherMenuTableViewController {
    
    //MARK: Private
    enum Constants {
        enum UI {
            enum SearchBar {
                
                //MARK: Static
                static let searchBarPlaceholder = "Search for a city"
                static let searchBarIconImageName = "magnifyingglass"
            }
            enum NavigationItam {
                
                //MARK: Static
                static let title = "Menu"
            }
            enum TableView {
                
                //MARK: Static
                static let header = "Cities"
                static let footer = "Learn more about weather data and map data on https://openweather.com"
                static let rowHeight: CGFloat = 30
            }
        }
    }
}


//MARK: - ViewController protocol
protocol WeatherMenuTableViewControllerProtocol: AnyObject {
    func setupMainUI()
    func updateRows(_ rows: [CityWeatherUIModel])
    func reloadTableView()
    func showLoadingView()
    func hideLoadingView()
}


//MARK: - Main ViewController
final class WeatherMenuTableViewController: UITableViewController {
        
    //MARK: Public
    var presenter: WeatherMenuPresenterProtocol?
    
    //MARK: Private
    private let searchBar = UISearchBar()
    private var loadingView: LoadingView?
    private var rows = [CityWeatherUIModel]()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }
    
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter?.onViewDidLoad()
    }

    //MARK: TableView DataSource protocol
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rows.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let uiModel = rows[indexPath.row]
        let cell = tableView.dequeueReusableCell(withModel: uiModel, indexPath: indexPath)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            presenter?.deleteCityWeather(rows[indexPath.row])
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.onDidSelect(row: indexPath.row)
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        Constants.UI.TableView.rowHeight
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        Constants.UI.TableView.header
    }
    
    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        Constants.UI.TableView.footer
    }
}


//MARK: - ViewController protocol extension
extension WeatherMenuTableViewController: WeatherMenuTableViewControllerProtocol {
    
    //MARK: Internal
    func setupMainUI() {
        title = Constants.UI.NavigationItam.title
        setupTableView()
        setupSearchBar()
    }
    
    func reloadTableView() {
        tableView.reloadData()
    }
    
    func updateRows(_ rows: [CityWeatherUIModel]) {
        self.rows = rows
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


//MARK: - Main methods
private extension WeatherMenuTableViewController {
    
    //MARK: Private
    func setupSearchBar() {
        searchBar.barStyle = .black
        searchBar.placeholder = Constants.UI.SearchBar.searchBarPlaceholder
        searchBar.delegate = self
        searchBar.searchBarStyle = .minimal
        navigationItem.titleView = searchBar
    }
    
    func setupTableView() {
        let cellIdentifier = String(describing: CityWeatherCityTableViewCell.self)
        let cellNib = UINib(nibName: cellIdentifier, bundle: nil)
        tableView.backgroundColor = .systemGroupedBackground
        tableView.register(cellNib, forCellReuseIdentifier: cellIdentifier)
        tableView.rowHeight = 120
    }
}


//MARK: - SearchBarDelegate protocol extension
extension WeatherMenuTableViewController: UISearchBarDelegate {
    
    //MARK: Internal
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let cityName = searchBar.text, !cityName.isEmpty {
            presenter?.addNewCityWeather(cityName)
            searchBar.text = nil
        }
        searchBar.resignFirstResponder()
    }
}
