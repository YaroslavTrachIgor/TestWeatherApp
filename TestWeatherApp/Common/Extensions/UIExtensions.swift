//
//  UIExtensions.swift
//  TestWeatherApp
//
//  Created by User on 2023-09-11.
//

import Foundation
import UIKit

//MARK: - View Fast methods
public extension UIView {
    
    //MARK: Public
    func addGradientBackground(firstColor: UIColor, secondColor: UIColor, cornerRadius: CGFloat, frame: CGRect! = nil) {
        clipsToBounds = false
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [firstColor.cgColor, secondColor.cgColor]
        gradientLayer.frame = frame == nil ? self.bounds : frame
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0, y: 1)
        gradientLayer.cornerRadius = cornerRadius
        print(gradientLayer.frame)
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
}

    
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


//MARK: - Color Fast methods
public extension UIColor {
    
    //MARK: Initialization
    static func hex(_ hexCode: String) -> UIColor {
        var cString: String = hexCode.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue: UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
