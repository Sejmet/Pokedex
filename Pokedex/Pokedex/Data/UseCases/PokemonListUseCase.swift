//
//  PokemonListUseCase.swift
//  Pokedex
//
//  Created by Sejmet on 17/06/2022.
//

import Foundation
import Combine

struct PokemonListUseCase: UseCase {
    private let repository: PokemonRepository = PokemonRepositoryImpl() //TODO: Inject
    
    func call(_ param: PokemonListParam) -> AnyPublisher<PaginatedList<Pokemon>, Error> {
        repository.getAllPokemons(param: param)
            .map { pokemonResponse -> PaginatedList<Pokemon> in
                
                guard let results = pokemonResponse.results, results.count > 0 else {
                    return PaginatedList.empty
                }
                
                let pokeArray = results
                    .enumerated()
                    .map { poke -> Pokemon in
                        return Pokemon(id: (param.offset + poke.offset + 1), name: poke.element.name, url: poke.element.url)
                    }
                
                return PaginatedList(count: pokemonResponse.count ?? 0, results: pokeArray, next: pokemonResponse.next ?? "")
                
            }
            .mapError { $0 as Error }
            .eraseToAnyPublisher()
    }
}
