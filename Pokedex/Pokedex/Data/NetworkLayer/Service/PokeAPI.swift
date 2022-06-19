//
//  PokeAPI.swift
//  Pokedex
//
//  Created by Sejmet on 17/06/2022.
//

import Foundation
import Alamofire

enum PokeAPI: URLRequestBuilder {
    case pokemon(PokemonParam)
    case ability(AbilityParam)
    case move(MoveParam)
    case allAbility
    case allPokemons(PokemonListParam)
    case allMoves
}

extension PokeAPI {
    var path: String {
        switch self {
        case .pokemon(let param):
            return "\(APIPath.Pokedex.pokemon)/\(param.nameOrId)"
        case .ability(let param):
            return "\(APIPath.Pokedex.ability)/\(param.nameOrId)"
        case .move(let param):
            return "\(APIPath.Pokedex.move)/\(param.nameOrId)"
        case .allAbility:
            return APIPath.Pokedex.ability
        case .allPokemons:
            return APIPath.Pokedex.pokemon
        case .allMoves:
            return APIPath.Pokedex.move
        }
    }
}

extension Encodable {
    func asDictionary() throws -> [String: Any] {
        let data = try JSONEncoder().encode(self)
        guard let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
            throw NSError()
        }
        return dictionary
    }
}

extension PokeAPI {
    var parameters: Parameters? {
        switch self {
        case .allPokemons(let param):
            return ["limit": 40, "offset": param.offset]
        case .pokemon, .ability, .allAbility , .allMoves, .move:
            return nil
        }
    }
}

extension PokeAPI {
    var method: HTTPMethod {
        switch self {
        case .pokemon, .ability, .allAbility, .allPokemons, .allMoves, .move:
            return HTTPMethod.get
        }
    }
}

extension PokeAPI {
    var headers: HTTPHeaders {
        switch self {
        case .pokemon, .ability, .allAbility, .allPokemons, .allMoves, .move:
            let header: HTTPHeaders = []
            return header
//            let header: HTTPHeaders = ["Authorization": "Bearer \(SessionManager.shared.token ?? "")"]
//            return header
        }
    }
}


