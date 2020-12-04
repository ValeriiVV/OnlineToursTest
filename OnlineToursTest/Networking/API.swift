//
//  EndPoints.swift
//  OnlineToursTest
//
//  Created by Valerii Korobov on 04.12.2020.
//

/// АПИ
struct API {
	static let baseUrl = "https://www.onlinetours.ru/api"
}

/// Версия АПИ
enum Version {
	static let version2 = "/v2"
}

/// Тип АПИ
enum ApiType {
	static let mobile = "/mobile_api"
}

/// Итерфейс для Endpoints
protocol Endpoint {
	var path: String { get }
	var url: String { get }
}

