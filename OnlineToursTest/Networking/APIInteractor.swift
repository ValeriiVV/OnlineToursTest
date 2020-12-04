//
//  APIInteractor.swift
//  OnlineToursTest
//
//  Created by Valerii Korobov on 04.12.2020.
//

import Foundation
import Alamofire

// Интерактор
final class APIInteractor {
	static let shared = APIInteractor()
}

// MARK: - ToursNetworkService
extension APIInteractor {
	func getTourList(completion: @escaping (Result<[Tour], Error>) -> Void) {
		AF.request(TourEndPoints.getTours.url)
			.validate()
			.responseDecodable(of: [Tour].self) { (response) in
				if let model = response.value {
					completion(Result.success(model))
				} else if let error = response.error {
					completion(Result.failure(error))
				}
			}
	}
}
