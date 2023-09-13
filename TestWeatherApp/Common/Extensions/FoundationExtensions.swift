//
//  FoundationExtensions.swift
//  TestWeatherApp
//
//  Created by User on 2023-09-11.
//

import Foundation

//MARK: - Fast URL Response checks
public extension HTTPURLResponse {
    
    //MARK: Public
    var isValidStatusCode: Bool {
        return (200...299).contains(self.statusCode)
    }
}


//MARK: - Fast String methods
public extension String {
    
    //MARK: Public
    func toCityAPIPath() -> String {
        let cityName = self.trimmingCharacters(in: .whitespacesAndNewlines).capitalized
        let query = cityName.replacingOccurrences(of: " ", with: "%20")
        return query
    }
}
