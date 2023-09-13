//
//  WeatherMenuAPIClient.swift
//  TestWeatherApp
//
//  Created by User on 2023-09-11.
//

import Foundation

//MARK: - GitHub User API client protocol
protocol WeatherMenuAPIClientProtocol {
    func getCityWeather() async throws -> CityWeather?
}

//MARK: - GitHub Users API client
final class WeatherMenuAPIClient: APIHelper, WeatherMenuAPIClientProtocol {
    
    //MARK: Internal
    func getCityWeather() async throws -> CityWeather? {
        do {
            let data = try await self.get()
            if let response: CityWeather = JSONHelper.decode(data) {
                return response
            } else {
                return nil
            }
        } catch {
            throw APIError.ACRequestError.unknownApplicationAPIGetError
        }
    }
}
