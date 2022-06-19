//
//  PokemonDetailViewModel.swift
//  Pokedex
//
//  Created by Sejmet on 18/06/2022.
//

import Foundation
import Combine

class PokemonDetailViewModel: ObservableObject {
    private var cancellables = Set<AnyCancellable>()
    private let pokemonDetailUseCase = PokemonDetailUseCase()
    
    @Published var isLoading: Bool = false
    @Published var error: Error?
    @Published var pokemon: Pokemon?
    var pokeId: Int
    let goBack: () -> Void
    
    init(pokeId: Int, goBack: @escaping () -> Void) {
        self.pokeId = pokeId
        self.goBack = goBack
        loadDetail()
    }
    
    private func loadDetail() {
        isLoading = true
        let param = PokemonParam(nameOrId: "\(pokeId)")
        pokemonDetailUseCase.call(param)
            .sink { [weak self] completion in
                guard let sSelf = self else { return }
                switch completion {
                case .finished:
                    Logger.debug("Finished")
                case .failure(let error):
                    sSelf.isLoading = false
                    sSelf.error = error
                }
            } receiveValue: { [weak self] pokemon in
                guard let sSelf = self else { return }
                sSelf.isLoading = false
                sSelf.pokemon = pokemon
            }
            .store(in: &cancellables)
    }
}
