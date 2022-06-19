//
//  PokemonListViewModel.swift
//  Pokedex
//
//  Created by Sejmet on 17/06/2022.
//

import Foundation
import Combine

class PokemonListViewModel: ObservableObject {
    private var cancellables = Set<AnyCancellable>()
    private let pokemonListUseCase = PokemonListUseCase()
    
    @Published var isLoading: Bool = false
    @Published var shouldLoadMore: Bool = false
    @Published var error: Error?
    @Published var pokemons: [Pokemon] = []
    
    init() {
        $shouldLoadMore
            .sink { [weak self] loadMore in
                guard let sSelf = self else { return }
                if loadMore {
                    sSelf.loadPokemons()
                }
            }
            .store(in: &cancellables)
        
        loadPokemons()
    }
    
    func loadPokemons() {
        isLoading = true
        let param = PokemonListParam(offset: pokemons.count)
        pokemonListUseCase.call(param)
            .sink { [weak self] completion in
                guard let sSelf = self else { return }
                switch completion {
                case .finished:
                    Logger.debug("Finished")
                case .failure(let error):
                    sSelf.isLoading = false
                    sSelf.error = error
                }
            } receiveValue: { [weak self] pokeArray in
                guard let sSelf = self else { return }
                sSelf.isLoading = false
                sSelf.pokemons.append(contentsOf: pokeArray.results)
            }
            .store(in: &cancellables)
    }
    
}
