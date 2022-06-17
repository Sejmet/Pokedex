//
//  AppCoordinator.swift
//  Pokedex
//
//  Created by Sejmet on 17/06/2022.
//

import SwiftUI
import FlowStacks

struct AppCoordinator: View {
    @ObservedObject var viewModel = AppCoordinatorViewModel()
    
    var body: some View {
        Router($viewModel.routes) { (screen, _)  in
            switch screen {
            case .pokemonsList(let vm):
                PokemonList(viewModel: vm)
            }
        }
    }
}
