//
//  CharacterViewModel.swift
//  HarryPotter
//
//  Created by Ricardo Santana on 08/02/22.
//

import UIKit

class CharacterViewModel {
    
    let network = CharacterNetwork()
    var characters: [Character] = []
    
    func fetchCharecters(completion: @escaping (Bool) -> Void) {
        network.getCharacter { characters in
            if let harryPotterCharacters = characters {
                self.characters = harryPotterCharacters
            }
            completion(characters != nil)
        }
    }
}
