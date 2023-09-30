//
//  AppDelegate.swift
//  TestWeatherApp
//
//  Created by User on 2023-09-11.
//

import UIKit

//MARK: - Main App Delegate
@main
final class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupBaseNavigationBar()
        return true
    }

    //MARK: UISceneSession Lifecycle
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {}
}


//MARK: - Main methods
private extension AppDelegate {
    
    //MARK: Private
    func setupBaseNavigationBar() {
        UINavigationBar.appearance().tintColor = .systemPink
    }
}
