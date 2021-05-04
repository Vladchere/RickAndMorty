//
//  ViewController.swift
//  RickAndMorty
//
//  Created by Vladislav on 29.04.2021.
//

import UIKit

class DetailViewController: UIViewController {

	// MARK: - IBOutlets
	@IBOutlet weak var characterImageView: UIImageView!
	@IBOutlet weak var nameLabel: UILabel!
	@IBOutlet weak var statusLabel: UILabel!
	@IBOutlet weak var speciesLabel: UILabel!
	@IBOutlet weak var genderLabel: UILabel!
	@IBOutlet weak var originLabel: UILabel!
	@IBOutlet weak var locationLabel: UILabel!

	// MARK: - Public properties
	var chracter: Result!

	override func viewDidLoad() {
		super.viewDidLoad()

		setupLabels()
		setupImage()
	}

	private func setupImage() {
		DispatchQueue.main.async {
			guard let strinURL = self.chracter.image else {return}
			guard let imageURL = URL(string: strinURL) else {return}
			guard let imageData = try? Data(contentsOf: imageURL) else {return}

			DispatchQueue.main.async {
				self.characterImageView.image = UIImage(data: imageData)
			}
		}
	}

	private func setupLabels() {
		nameLabel.text = "My name is \(chracter.name ?? "")"
		statusLabel.text = "Status - \(chracter.status ?? "")"
		speciesLabel.text = "Species - \(chracter.species ?? "")"
		genderLabel.text = "Gender - \(chracter.gender ?? "")"
		originLabel.text = "Origin - \(chracter.origin?.name ?? "")"
		locationLabel.text = "Location - \(chracter.location?.name ?? "")"
	}
}

