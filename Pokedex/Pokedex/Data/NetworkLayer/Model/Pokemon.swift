//
//  Pokemon.swift
//  Pokedex
//
//  Created by Sejmet on 17/06/2022.
//

import Foundation

struct Pokemon: Codable, Identifiable {
    var id: Int?
    var name: String?
    var order: Int?
    var url: String?
    var height: Int?
    var weight: Int?
    var locationAreaEncounters: String?
    var moves: [Move]?
    var abilities: [Ability]?
    var sprites: Sprite?
    var stats: [Stat]?
    var types: [PokeType]?
    
    internal enum CodingKeys: String, CodingKey {
        case id, name, url, abilities, height, stats, sprites, types, weight, moves, order
        case locationAreaEncounters = "location_area_encounters"
    }
}

struct Sprite: Codable {
    var backDefault: String?
    var backFemale: String?
    var backShiny: String?
    var backShinyFemale: String?
    var frontDefault: String?
    var frontFemale: String?
    var frontShiny: String?
    var frontShinyFemale: String?
    
    internal enum CodingKeys: String, CodingKey {
        case backDefault = "back_default"
        case backFemale = "back_female"
        case backShiny = "back_shiny"
        case backShinyFemale = "back_shiny_female"
        case frontDefault = "front_default"
        case frontFemale = "front_female"
        case frontShiny = "front_shiny"
        case frontShinyFemale = "front_shiny_female"
    }
}

struct PokemonResponse: Codable {
    var count: Int?
    var next: String?
    var previous: String?
    var results: [Pokemon]?
}
