//
//  PokeType.swift
//  Pokedex
//
//  Created by Sejmet on 17/06/2022.
//

import Foundation

struct PokeType: Codable {
    var info: Information?
    
    internal enum CodingKeys: String, CodingKey {
        case info = "type"
    }
}
