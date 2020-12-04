//
//  Tour.swift
//  OnlineToursTest
//
//  Created by Valerii Korobov on 04.12.2020.
//

struct Tour {
	let avgAirTemp: Double?
	let countryID: Int?
	let countryName: String?
	let minWaterTemp: Double?
	let photo: String?
	let regionID: Int?
	let regionName: String?
	let top: Top?
	let regionTags: [String]?
}

extension Tour: Decodable {

	enum TourCodingKeys: String, CodingKey {
		case avgAirTemp = "avg_air_temp"
		case countryID = "country_id"
		case countryName
		case minWaterTemp = "min_water_temp"
		case photo
		case regionID = "region_id"
		case regionName = "region_name"
		case top
		case regionTags = "region_tags"
	}

	init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: TourCodingKeys.self)

		avgAirTemp = try container.decode(Double.self, forKey: .avgAirTemp)
		countryID = try container.decode(Int.self, forKey: .countryID)
		countryName = try container.decode(String.self, forKey: .countryName)
		minWaterTemp = try container.decode(Double.self, forKey: .minWaterTemp)
		photo = try container.decode(String.self, forKey: .photo)
		regionID = try container.decode(Int.self, forKey: .regionID)
		regionName = try container.decode(String.self, forKey: .regionName)
		top = try container.decode(Top.self, forKey: .top)
		regionTags = try container.decode([String].self, forKey: .regionTags)
	}
}

