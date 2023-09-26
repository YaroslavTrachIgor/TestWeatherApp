//
//  LoadingView.swift
//  TestWeatherApp
//
//  Created by User on 2023-09-12.
//

import Foundation
import UIKit

//MARK: - Main View
final class LoadingView: UIView {
    
    //MARK: Private
    private let activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.color = .systemGray4
        return indicator
    }()
    
    
    //MARK: Initialization
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupActivityIndicator()
        backgroundColor = .clear
    }
    
    
    //MARK: Public
    func startAnimating() {
        activityIndicator.startAnimating()
    }
    
    func stopAnimating() {
        activityIndicator.stopAnimating()
    }
}


//MARK: - Main methods
private extension LoadingView {
    
    //MARK: Private
    func setupActivityIndicator() {
        addSubview(activityIndicator)
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
