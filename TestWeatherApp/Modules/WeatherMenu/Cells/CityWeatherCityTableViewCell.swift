//
//  CityWeatherCityTableViewCell.swift
//  TestWeatherApp
//
//  Created by User on 2023-09-11.
//

import Foundation
import UIKit

//MARK: - Constants
private extension CityWeatherCityTableViewCell {
    
    //MARK: Private
    enum Constants {
        enum View {
            
            //MARK: Static
            static let backgroundFirstColor = UIColor.hex("#457fca")
            static let backgroundSecondColor = UIColor.hex("#5691c8")
        }
    }
}


//MARK: - Main TableView Cell
final class CityWeatherCityTableViewCell: UITableViewCell {

    //MARK: @IBOutlets
    @IBOutlet weak var cityNameLabel: UILabel! {
        didSet {
            cityNameLabel.textColor = .white
        }
    }
    @IBOutlet weak var tempLabel: UILabel! {
        didSet {
            tempLabel.textColor = .white
        }
    }
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var lowHighTempLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var contentBackView: UIView!
    
    //MARK: Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupCell()
        setupContentBackView()
    }
}


//MARK: - Main methods
private extension CityWeatherCityTableViewCell {
    
    //MARK: Private
    func setupCell() {
        tintColor = .white.withAlphaComponent(0.8)
        backgroundColor = .clear
    }
    
    func setupContentBackView() {
        let backgroundFirstColor = Constants.View.backgroundFirstColor
        let backgroundSecondColor = Constants.View.backgroundSecondColor
        let backgroundGradientHeight = contentBackView.frame.height
        let backgroundGradientWidth = contentBackView.frame.width + 28
        let backgroundGradientFrame = CGRect(x: 0, y: 0, width: backgroundGradientWidth, height: backgroundGradientHeight)
        contentBackView.backgroundColor = .clear
        contentBackView.addGradientBackground(firstColor: backgroundFirstColor,
                                              secondColor: backgroundSecondColor,
                                              cornerRadius: 20,
                                              frame: backgroundGradientFrame)
    }
}
