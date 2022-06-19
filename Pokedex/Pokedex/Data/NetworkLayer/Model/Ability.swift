//
//  Ability.swift
//  Pokedex
//
//  Created by Sejmet on 17/06/2022.
//

import Foundation

struct Ability: Codable {
    var info: Information?
    var isHidden: Bool?
    
    internal enum CodingKeys: String, CodingKey {
        case info = "ability"
        case isHidden = "is_hidden"
    }
}
