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

		NetworkManager.shared.getCharacter(stringUrl: url) { (character) in
			DispatchQueue.main.async {
				self.character = character
				self.tableView.reloadData()
				print(character.results?.count ?? 0)
			}
		}
	}

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return character?.results?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MainTableViewCell

		if let result = character?.results?[indexPath.row] {
			cell.configure(with: result)
		}

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
