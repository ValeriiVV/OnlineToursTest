//
//  TourListConfigurator.swift
//  OnlineToursTest
//
//  Created by Valerii Korobov on 04.12.2020.
//

import UIKit

/// Конфигуратор модуля TourList
final class TourListConfigurator: TourListConfiguratorProtocol {

	static func createTourListModule() -> UIViewController {
		let navController = mainStoryboard.instantiateViewController(withIdentifier: Constants.StoryboardID.tourList)
		if let view = navController.children.first as? TourListViewController {
			let presenter: TourListPresenterProtocol & TourListInteractorOutputProtocol = TourListPresenter()
			let networkService: ToursNetworkServiceProtocol = ToursNetworkService()
			let interactor: TourListInteractorInputProtocol = TourListInteractor(networkService: networkService)
			let router: TourListRouterProtocol = TourListRouter()
			let dataSource: TourListDataSourceProtocol = TourListDataSource()

			view.presenter = presenter
			presenter.view = view
			presenter.router = router
			presenter.dataSource = dataSource
			presenter.interactor = interactor
			interactor.presenter = presenter

			return navController
		}
		return UIViewController()
	}

	static var mainStoryboard: UIStoryboard {
		return UIStoryboard(name: "Main", bundle: Bundle.main)
	}
}
