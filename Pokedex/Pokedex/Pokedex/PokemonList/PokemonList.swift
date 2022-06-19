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
        List {
            ForEach(viewModel.pokemons) { pokemon in
                HStack {
                    Text("#\(pokemon.id ?? 0)")
                        .font(Font.system(size: 20))
                        .foregroundColor(Color.black)
                    
                    Text(pokemon.name ?? "")
                        .font(Font.system(size: 20))
                        .foregroundColor(Color.black)
                        .onAppear {
                            if pokemon.name == viewModel.pokemons.last?.name {
                                viewModel.shouldLoadMore = true
                            }
                        }
                }
                .padding(.vertical, 10)
            }
        }
        .listStyle(.plain)
    }
}

struct PokemonList_Previews: PreviewProvider {
    static var previews: some View {
        PokemonList(viewModel: PokemonListViewModel())
    }
}
