//
//  TourListViewController.swift
//  OnlineToursTest
//
//  Created by Valerii Korobov on 04.12.2020.
//

import UIKit
import PKHUD

final class TourListViewController: UIViewController {

	@IBOutlet weak var tableView: UITableView!
	var presenter: TourListPresenterProtocol?
	var router: TourListRouterProtocol?
	var tourList: [Tour] = []

	override func viewDidLoad() {
		super.viewDidLoad()
		presenter?.viewDidLoad()
		tableView.tableFooterView = UIView()
		tableView.dataSource = presenter?.dataSource
		tableView.registerReusable(reusableClass: TourListTableViewCell.self)

		self.title = "test"
	}
}

extension TourListViewController: TourListViewControllerProtocol {

	func showTours(with tours: [Tour]) {
		tourList = tours
		tableView.reloadData()
	}

	func showError() {
		HUD.flash(.label("test error"), delay: 2.0)
	}

	func showLoading() {
		HUD.show(.progress)
	}

	func hideLoading() {
		HUD.hide()
	}
}
