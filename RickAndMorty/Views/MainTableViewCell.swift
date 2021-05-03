//
//  MainTableViewCell.swift
//  RickAndMorty
//
//  Created by Vladislav on 03.05.2021.
//

import UIKit

class MainTableViewCell: UITableViewCell {

	// MARK: -IBOutlets
	@IBOutlet var characterImageView: UIImageView!{
		didSet {
			characterImageView.contentMode = .scaleAspectFit
			characterImageView.clipsToBounds = true
			characterImageView.layer.cornerRadius = characterImageView.bounds.height / 2
			characterImageView.backgroundColor = .white
		}
	}
	@IBOutlet var nameLabel: UILabel!

	// MARK: - Public methods
	func configure(with result: Result) {
		nameLabel.text = result.name

		DispatchQueue.main.async {
			guard let strinURL = result.image else {return}
			guard let imageURL = URL(string: strinURL) else {return}
			guard let imageData = try? Data(contentsOf: imageURL) else {return}

			DispatchQueue.main.async {
				self.characterImageView.image = UIImage(data: imageData)
			}
		}
	}
}
