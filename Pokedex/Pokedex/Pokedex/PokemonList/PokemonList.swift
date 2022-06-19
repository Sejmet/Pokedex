//
//  PokemonList.swift
//  Pokedex
//
//  Created by Sejmet on 17/06/2022.
//

import SwiftUI

struct PokemonList: View {
    @ObservedObject var viewModel: PokemonListViewModel
    
    var body: some View {
        ZStack {
            List {
                ForEach(viewModel.pokemons) { pokemon in
                    Button(action: {
                        viewModel.goToDetail(pokeId: pokemon.id ?? 0)
                    }) {
                        getPokemonCell(pokemon: pokemon)
                    }
                }
            }
            .listStyle(.plain)
            
            ProgressView()
                .opacity(viewModel.isLoading ? 1 : 0)
        }
        .navigationBar(navBarTitle: "Pokedex")
    }
    
    func getPokemonCell(pokemon: Pokemon) -> PokemonView {
        return PokemonView(pokemon: pokemon)
    }
}

struct PokemonList_Previews: PreviewProvider {
    static var previews: some View {
        PokemonList(viewModel: PokemonListViewModel())
    }
}
