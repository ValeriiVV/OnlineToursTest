//
//  TourEndPoints.swift
//  OnlineToursTest
//
//  Created by Valerii Korobov on 04.12.2020.
//

import Foundation
import Alamofire

// Ендпоинты
enum TourEndPoints: Endpoint {
	case getTours

	public var path: String {
		switch self {
		case .getTours: return "/feed"
		}
	}

	public var url: String {
		switch self {
		case .getTours: return "\(API.baseUrl)\(Version.version2)\(ApiType.mobile)\(path)"
		}
	}
}
