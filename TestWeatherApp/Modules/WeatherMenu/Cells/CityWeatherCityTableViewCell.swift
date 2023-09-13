//
//  CityWeatherCityTableViewCell.swift
//  TestWeatherApp
//
//  Created by User on 2023-09-11.
//

import UIKit

//MARK: - Main TableView Cell
final class CityWeatherCityTableViewCell: UITableViewCell {

    //MARK: @IBOutlets
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var weatherDescriptionLabel: UILabel!
    
    //MARK: Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundColor = .secondarySystemGroupedBackground
        accessoryType = .disclosureIndicator
    }
}
