//
//  CharacterModel.swift
//  HarryPotter
//
//  Created by Ricardo Santana on 08/02/22.
//

import Foundation

struct Character: Codable {
    var name: String?
    var house: String?
    var actorName: String?
    var image: String?
    
    private enum CodingKeys: String, CodingKey {
        case name, house, image
        case actorName = "actor"
    }
}
