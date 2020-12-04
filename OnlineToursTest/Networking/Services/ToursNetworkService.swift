//
//  ToursNetworkManager.swift
//  OnlineToursTest
//
//  Created by Valerii Korobov on 04.12.2020.
//

import Foundation
import Alamofire

protocol ToursNetworkServiceProtocol {
	func getTourList(completion: @escaping (Result<[Tour], Error>) -> Void)
}

final class ToursNetworkService: ToursNetworkServiceProtocol {
	func getTourList(completion: @escaping (Result<[Tour], Error>) -> Void) {
		APIInteractor.shared.getTourList(completion: completion)
	}
}
