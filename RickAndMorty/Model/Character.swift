//
//  Character.swift
//  RickAndMorty
//
//  Created by Vladislav on 01.05.2021.
//

import Foundation

struct Character: Decodable {
	let results: [Result]?
}

struct Result: Decodable {
	let id: Int?
	let name: String?
	let status: String?
	let species: String?
	let gender: String?
	let origin: Origin?
	let location: Location?
	let image: String?
}

struct Origin: Decodable {
	let name: String?
}

struct Location: Decodable {
	let name: String?
}
