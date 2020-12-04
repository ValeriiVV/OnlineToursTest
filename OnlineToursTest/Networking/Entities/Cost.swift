//
//  Cost.swift
//  OnlineToursTest
//
//  Created by Valerii Korobov on 04.12.2020.
//

struct Cost {
	let duration: Int?
	let hotel: Hotel?
	let mobileOfferID: String?
	let price: Price?
	let startDate: String?
	let updatedAt: String?
}

extension Cost: Decodable {
	
	enum CostCodingKeys: String, CodingKey {
		case duration
		case hotel
		case mobileOfferID = "mobile_offer_id"
		case price
		case startDate = "start_date"
		case updatedAt = "updated_at"
	}
	
	init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CostCodingKeys.self)
		
		duration = try container.decode(Int.self, forKey: .duration)
		hotel = try container.decode(Hotel.self, forKey: .hotel)
		mobileOfferID = try container.decode(String.self, forKey: .mobileOfferID)
		price = try container.decode(Price.self, forKey: .price)
		startDate = try container.decode(String.self, forKey: .startDate)
		updatedAt = try container.decode(String.self, forKey: .updatedAt)
	}
}
