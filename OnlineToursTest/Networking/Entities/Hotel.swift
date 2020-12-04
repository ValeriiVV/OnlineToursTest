//
//  Hotel.swift
//  OnlineToursTest
//
//  Created by Valerii Korobov on 04.12.2020.
//

struct Hotel {
	let countryID: Int?
	let id: Int?
	let name: String?
	let rating: Double?
	let stars: Double?
	let photos: [String]?
}

extension Hotel: Decodable {

	enum HotelCodingKeys: String, CodingKey {
		case countryID = "country_id"
		case id
		case name
		case rating
		case stars
		case photos
	}

	init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: HotelCodingKeys.self)

		countryID = try container.decode(Int.self, forKey: .countryID)
		id = try container.decode(Int.self, forKey: .id)
		name = try container.decode(String.self, forKey: .name)
		rating = try container.decode(Double.self, forKey: .rating)
		stars = try container.decode(Double.self, forKey: .stars)
		photos = try container.decode([String].self, forKey: .photos)
	}
}
