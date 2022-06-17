//
//  Stat.swift
//  Pokedex
//
//  Created by Sejmet on 17/06/2022.
//

import Foundation

struct Stat: Codable {
    var baseStat: Int?
    var effort: Int?
    var info: Information?
    
    internal enum CodingKeys: String, CodingKey {
        case baseStat = "base_stat"
        case effort = "effort"
        case info = "stat"
    }
}
