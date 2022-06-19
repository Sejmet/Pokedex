//
//  AppCoordinatorViewModel.swift
//  Pokedex
//
//  Created by Sejmet on 17/06/2022.
//

import SwiftUI
import Combine
import FlowStacks

class AppCoordinatorViewModel: ObservableObject {
    @Published var routes: Routes<Screen> = []
    
    init() {
        let vm = PokemonListViewModel()
        vm.pokemonDetail = { pokeId in
            self.goToDetail(pokeId: pokeId)
        }
        routes = [.root(.pokemonsList(vm), embedInNavigationView: true)]
    }
    
    private func goToDetail(pokeId: Int) {
        let vm = PokemonDetailViewModel(pokeId: pokeId, goBack: goBack)
        routes.push(.pokemonDetail(vm))
    }
    
    private func dismiss() {
        routes.dismiss()
    }
    
    private func goBack() {
        routes.goBack()
    }
    
    private func goBackToRoot() {
        routes.goBackToRoot()
    }
}
