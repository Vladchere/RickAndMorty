//
//  ViewController.swift
//  RickAndMorty
//
//  Created by Vladislav on 29.04.2021.
//

import UIKit

class DetailViewController: UIViewController {

	// MARK: - IBOutlets
	@IBOutlet weak var characterImageView: ImageView!

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
		characterImageView.fetchImage(from: chracter.image ?? "")
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

