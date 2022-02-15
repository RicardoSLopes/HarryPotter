//
//  ViewController.swift
//  HarryPotter
//
//  Created by Ricardo Santana on 03/02/22.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet private var tableView: UITableView!
    
    var viewModel = CharacterViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    func setUI() {
        tableView.delegate = self
        tableView.dataSource = self
        fetchCharacters()
    }
    
    func fetchCharacters() {
        viewModel.fetchCharecters { flag in
            if flag {
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let character = viewModel.characters[indexPath.row]
        cell.textLabel?.text = character.name
        cell.detailTextLabel?.text = character.house
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name: "Detail", bundle: nil)
        guard let detailVC = storyBoard.instantiateViewController(withIdentifier: "detailVC") as? DetailViewController else { return }
        detailVC.character = viewModel.characters[indexPath.row]
        self.present(detailVC, animated: true, completion: nil)
    }

}
