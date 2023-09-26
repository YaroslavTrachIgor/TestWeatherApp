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


//MARK: - Fast Sequence methods
public extension Sequence {
    func concurrentForEach(
        _ operation: @escaping (Element) async -> Void
    ) async {
        // A task group automatically waits for all of its
        // sub-tasks to complete, while also performing those
        // tasks in parallel:
        await withTaskGroup(of: Void.self) { group in
            for element in self {
                group.addTask {
                    await operation(element)
                }
            }
        }
    }
}
