//
//  TourListInteractor.swift
//  OnlineToursTest
//
//  Created by Valerii Korobov on 04.12.2020.
//

import Foundation

/// Интерактор модуля TourList
final class TourListInteractor: TourListInteractorInputProtocol {

	/// Делегат интерактора
	weak var presenter: TourListInteractorOutputProtocol?

	/// Сервис для загрузки экранных данных
	var networkService: ToursNetworkServiceProtocol?

	private var tourList: [Tour]?

	init(networkService: ToursNetworkServiceProtocol) {
		self.networkService = networkService
	}

	func loadTourList() {
		networkService?.getTourList(completion: { [weak self] result in
			guard let self = self else { return }
			switch result {
			case .success(_):
				// TODO: исполозвать реальные данные, когда появится работающий бэк
				self.presenter?.didRetrievePosts(self.toursMock())
			case .failure(_):
				// TODO: исполозвать ошибку, когда появится работающий бэк
				self.presenter?.onError()
				()
			}
		})
	}
}

// MARK: - Mocks
// TODO: Удалить когда появится бэк
extension TourListInteractor {
	private func toursMock() -> [Tour] {
		let price = Price(total: 13.999)
		let url = "https://imgcy.trivago.com/c_limit,d_dummy.jpeg,f_auto,h_1300,q_auto,w_2000/itemimages/96/95/96959_v6.jpeg"
		let hotel = Hotel(countryID: nil,
						  id: nil,
						  name: "Тестовый отель",
						  rating: 5,
						  stars: 5,
						  photos: [url])
		let cost = Cost(duration: nil,
						hotel: hotel,
						mobileOfferID: nil,
						price: price,
						startDate: "17.10",
						updatedAt: "27.10")
		let top = Top(cost: cost)
		let tour = Tour(avgAirTemp: 0,
						countryID: 100,
						countryName: "Russis",
						minWaterTemp: nil,
						photo: nil,
						regionID: nil,
						regionName: nil,
						top: top,
						regionTags: nil)
		return [tour, tour, tour]
	}
}
