//
//  CharacterModel.swift
//  HarryPotter
//
//  Created by Ricardo Santana on 08/02/22.
//

import Foundation

struct Character: Codable {
    let name: String?
    let house: String?
    let actorName: String?
    let image: String?
    
    private enum CodingKeys: String, CodingKey {
        case name, house, image
        case actorName = "actor"
    }
}
