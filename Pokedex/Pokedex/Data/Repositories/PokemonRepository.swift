//
//  PokemonRepository.swift
//  Pokedex
//
//  Created by Sejmet on 17/06/2022.
//

import Foundation
import Combine

protocol PokemonRepository {
    func getPokemon(param: PokemonParam) -> AnyPublisher<Pokemon, NetworkError>
    func getAllPokemons(param: PokemonListParam) -> AnyPublisher<PokemonResponse, NetworkError>
}

public struct PokemonRepositoryImpl: PokemonRepository {
    private let networkService: NetworkService = NetworkService()
    
    func getPokemon(param: PokemonParam) -> AnyPublisher<Pokemon, NetworkError> {
        networkService.execute(Endpoints.pokemon(param).resolve())
    }
    
    func getAllPokemons(param: PokemonListParam) -> AnyPublisher<PokemonResponse, NetworkError> {
        networkService.execute(Endpoints.allPokemons(param).resolve())
    }
}
