//
//  Endpoints.swift
//  Pokedex
//
//  Created by Sejmet on 17/06/2022.
//

import Foundation

public enum Endpoints {
    case pokemon(PokemonParam)
    case ability(AbilityParam)
    case move(MoveParam)
    case allPokemons
    case allAbility
    case allMoves
}

public extension Endpoints {
    func resolve() -> URLRequestBuilder {
        switch self {
        case .pokemon(let param):
            return PokeAPI.pokemon(param)
        case .ability(let param):
            return PokeAPI.ability(param)
        case .allPokemons:
            return PokeAPI.allPokemons
        case .allAbility:
            return PokeAPI.allAbility
        case .move(let param):
            return PokeAPI.move(param)
        case .allMoves:
            return PokeAPI.allMoves
        }
    }
}

