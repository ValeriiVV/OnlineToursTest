//
//  TableView+Reusable.swift
//  OnlineToursTest
//
//  Created by Valerii Korobov on 04.12.2020.
//

import UIKit

protocol Reusable {
	static var reuseIdentifier: String { get }
}

extension Reusable {
	static var reuseIdentifier: String {
		return "\(self)"
	}
}

extension UITableView {
	func registerReusable<T: Reusable>(reusableClass: T.Type, nib: UINib? = nil) {
		register(nib ?? UINib(nibName: T.reuseIdentifier, bundle: nil) ,
						 forCellReuseIdentifier: T.reuseIdentifier)
	}
}

extension UITableViewCell: Reusable {}
