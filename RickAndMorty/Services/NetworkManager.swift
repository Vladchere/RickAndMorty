//
//  NetworkManager.swift
//  RickAndMorty
//
//  Created by Vladislav on 01.05.2021.
//

import Foundation

class NetworkManager {
	static let shared = NetworkManager()
	init() {}

	func getCharacter(stringUrl: String, with completion: @escaping (Character) -> Void) {
		guard let url = URL(string: stringUrl) else { return }

		URLSession.shared.dataTask(with: url) { (data, response, error) in
			guard let data = data else { return }

			do {
				let character = try JSONDecoder().decode(Character.self, from: data)
				completion(character)
			} catch let error {
				print(error.localizedDescription)
			}
		}.resume()
	}
}
