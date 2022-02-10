//
//  DetailViewController.swift
//  HarryPotter
//
//  Created by Ricardo Santana on 08/02/22.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet private var actorNameLabel: UILabel!
    @IBOutlet private var characterNameLabel: UILabel!
    @IBOutlet private var houseNameLabel: UILabel!
    @IBOutlet private var profileImageView: UIImageView!
    
    var character: Character?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        if let character = character {
            actorNameLabel.text = character.actorName
            characterNameLabel.text = character.name
            houseNameLabel.text = character.house
            guard let imageURL = character.image else { return }
            profileImageView.getImageFromURL(imageURL)
        }
    }
    
}
