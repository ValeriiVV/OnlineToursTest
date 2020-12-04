//
//  AppDelegate.swift
//  OnlineToursTest
//
//  Created by Valerii Korobov on 04.12.2020.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

		let tourListView = TourListConfigurator.createTourListModule()

		window = UIWindow(frame: UIScreen.main.bounds)
		window?.rootViewController = tourListView
		window?.makeKeyAndVisible()

		return true
	}
}

