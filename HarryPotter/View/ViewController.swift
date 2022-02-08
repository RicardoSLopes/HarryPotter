//
//  ViewController.swift
//  HarryPotter
//
//  Created by Ricardo Santana on 03/02/22.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet var tableView: UITableView!
    var characters: [Character] = []
    var netWork = Network()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        netWork.network()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let character = characters[indexPath.row]
        
        cell.textLabel?.text = character.name
        cell.detailTextLabel?.text = character.house
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }

}
