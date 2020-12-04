//
//  TourListTableViewCell.swift
//  OnlineToursTest
//
//  Created by Valerii Korobov on 04.12.2020.
//

import UIKit
import AlamofireImage

final class TourListTableViewCell: UITableViewCell {

	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var dateFromLabel: UILabel!
	@IBOutlet weak var dateToLabel: UILabel!
	@IBOutlet weak var botomButton: UIButton!
	@IBOutlet weak var tourImageView: UIImageView!

	func set(forPost tour: Tour) { // TODO: Добавить модель для ячейки вместо Tour когда будет бэк
		self.selectionStyle = .none
		let buttonTitle = "\(tour.top?.cost?.price?.total ?? 0) P"
		titleLabel?.text = tour.top?.cost?.hotel?.name
		dateFromLabel?.text = tour.top?.cost?.startDate
		dateToLabel?.text = tour.top?.cost?.updatedAt
		botomButton.setTitle(buttonTitle, for: .normal)
	}
}
