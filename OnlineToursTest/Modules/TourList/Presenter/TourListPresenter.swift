//
//  TourListPresenter.swift
//  OnlineToursTest
//
//  Created by Valerii Korobov on 04.12.2020.
//

/// Презентер модуля TourList
final class TourListPresenter: TourListPresenterProtocol {
	weak var view: TourListViewControllerProtocol?
	var interactor: TourListInteractorInputProtocol?
	var router: TourListRouterProtocol?
	var dataSource: TourListDataSourceProtocol?

	func viewDidLoad() {
		view?.showLoading()
		interactor?.loadTourList()
	}
}

extension TourListPresenter: TourListInteractorOutputProtocol {
	func didRetrievePosts(_ tours: [Tour]) {
		view?.hideLoading()
		dataSource?.update(with: tours)
		view?.showTours(with: tours)
	}

	func onError() {
		view?.hideLoading()
		view?.showError()
	}
}
