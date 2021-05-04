//
//  MainTableViewCell.swift
//  RickAndMorty
//
//  Created by Vladislav on 03.05.2021.
//

import UIKit

class MainTableViewCell: UITableViewCell {

	// MARK: -IBOutlets

	@IBOutlet var nameLabel: UILabel!
	@IBOutlet var characterImageView: ImageView! {
		didSet {
			characterImageView.contentMode = .scaleAspectFit
			characterImageView.clipsToBounds = true
			characterImageView.layer.cornerRadius = characterImageView.bounds.height / 2
			characterImageView.backgroundColor = .white
		}
	}


	// MARK: - Public methods
	func configure(with result: Result) {
		nameLabel.text = result.name
		characterImageView.fetchImage(from: result.image ?? "")
	}
}
