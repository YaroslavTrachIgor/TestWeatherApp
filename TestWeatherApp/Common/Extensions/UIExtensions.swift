//
//  UIExtensions.swift
//  TestWeatherApp
//
//  Created by User on 2023-09-11.
//

import Foundation
import UIKit

//MARK: - TableView Fast methods
extension UITableView {
    
    //MARK: Internal
    func dequeueReusableCell(withModel model: BaseCellAnyUIModel, indexPath: IndexPath) -> UITableViewCell {
        let identifier = String(describing: type(of: model).cellAnyType)
        let cell = self.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        model.setupAny(cell: cell)
        return cell
    }
}
