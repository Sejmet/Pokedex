//
//  PokemonDetailUseCase.swift
//  Pokedex
//
//  Created by Sejmet on 17/06/2022.
//

import Foundation
import Combine

struct PokemonDetailUseCase: UseCase {
    let repository: PokemonRepository = PokemonRepositoryImpl() //TODO: Inject
    
    func call(_ param: PokemonParam) -> AnyPublisher<Pokemon, Error> {
        repository.getPokemon(param: param)
            .mapError { $0 as Error }
            .eraseToAnyPublisher()
    }
}
