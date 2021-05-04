//
//  MainTableViewController.swift
//  RickAndMorty
//
//  Created by Vladislav on 01.05.2021.
//

import UIKit

class MainTableViewController: UITableViewController {

	// MARK: -Public properties
	var character: Character?

	// MARK: -Private properties
	private let url = "https://rickandmortyapi.com/api/character"

	private let searchController = UISearchController(searchResultsController: nil)
	private var firlteredCharacter: [Result] = []
	private var searchBarIsEmpty: Bool {
		guard let text = searchController.searchBar.text else { return false }
		return text.isEmpty
	}
	private var isFiltering: Bool {
		return searchController.isActive && !searchBarIsEmpty
	}

	override func viewDidLoad() {
		super.viewDidLoad()

		tableView.rowHeight = 100
		setupSearchController()

		NetworkManager.shared.getCharacter(stringUrl: url) { (character) in
			DispatchQueue.main.async {
				self.character = character
				self.tableView.reloadData()
			}
		}
	}

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		isFiltering ? firlteredCharacter.count : character?.results?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MainTableViewCell

		if let result = isFiltering ? firlteredCharacter[indexPath.row] : character?.results?[indexPath.row] {
			DispatchQueue.main.async {
				cell.configure(with: result)
			}
		}

        return cell
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		guard let indexPath = tableView.indexPathForSelectedRow else { return }
		let person = isFiltering ? firlteredCharacter[indexPath.row] : character?.results?[indexPath.row]
		let detailVC = segue.destination as! DetailViewController
		detailVC.chracter = person
    }

	// MARK: - Private methods
	private func setupSearchController() {
		searchController.searchResultsUpdater = self
		searchController.obscuresBackgroundDuringPresentation = false
		searchController.searchBar.placeholder = "Search"

		navigationItem.searchController = searchController
		definesPresentationContext = true

		if let textField = searchController.searchBar.value(forKey: "searchField") as? UITextField {
			textField.textColor = .white
		}
	}
}

extension MainTableViewController: UISearchResultsUpdating {
	func updateSearchResults(for searchController: UISearchController) {
		filterContentForSearchText(searchController.searchBar.text!)
	}

	private func filterContentForSearchText(_ searchText: String) {
		firlteredCharacter = character?.results?.filter { character in
			(character.name?.lowercased().contains(searchText.lowercased()) ?? false)
		} ?? []

		tableView.reloadData()
	}
}
