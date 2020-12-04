//
//  APIInteractor.swift
//  OnlineToursTest
//
//  Created by Valerii Korobov on 04.12.2020.
//

import UIKit

/// Интерфейс котроллера модуля TourList
protocol TourListViewControllerProtocol: class {
	var router: TourListRouterProtocol? { get }
	var presenter: TourListPresenterProtocol? { get set }

	func showTours(with tours: [Tour])
	func showError()
	func showLoading()
	func hideLoading()
}

/// Интерфейс роутера модуля TourList
protocol TourListRouterProtocol: class {}

/// Интерфейс интерактора модуля TourList
protocol TourListInteractorInputProtocol: class {
	var presenter: TourListInteractorOutputProtocol? { get set }
	func loadTourList()
}

/// Интерфейс делегата интерактора модуля TourList
protocol TourListInteractorOutputProtocol: class {
	func didRetrievePosts(_ tours: [Tour])
	func onError()
}

/// Интерфейс презентера модуля TourList
protocol TourListPresenterProtocol: class {
	var view: TourListViewControllerProtocol? { get set }
	var interactor: TourListInteractorInputProtocol? { get set }
	var router: TourListRouterProtocol? { get set }
	var dataSource: TourListDataSourceProtocol? { get set }

	func viewDidLoad()
}

/// Интерфейс конфигуратора модуля TourList
protocol TourListConfiguratorProtocol: class {
	static func createTourListModule() -> UIViewController
}
