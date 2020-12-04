//
//  TourListDataSource.swift
//  OnlineToursTest
//
//  Created by Valerii Korobov on 04.12.2020.
//

import UIKit
import AlamofireImage

protocol TourListDataSourceProtocol: UITableViewDataSource, UITableViewDelegate {
	func update(with tours: [Tour]?)
}

final class TourListDataSource: NSObject, TourListDataSourceProtocol {

	private var tourList: [Tour]? = []

	func update(with tours: [Tour]?) {
		self.tourList = tours
	}

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		tourList?.count ?? 0
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: TourListTableViewCell.reuseIdentifier)
		guard let tourCell = cell as? TourListTableViewCell,
			  let tourModel = tourList?[indexPath.row] else {
			return UITableViewCell()
		}

		tourCell.set(forPost: tourModel)

		guard let photoUrlString = tourModel.top?.cost?.hotel?.photos?.compactMap({$0}).first,
			  let photoUrl = URL(string: photoUrlString) else {
			return tourCell
		}

		tourCell.tourImageView.af.setImage(withURL: photoUrl, placeholderImage: nil)

		return tourCell
	}
}
