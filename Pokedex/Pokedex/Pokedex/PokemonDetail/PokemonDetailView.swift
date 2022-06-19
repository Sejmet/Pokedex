//
//  PokemonDetailView.swift
//  Pokedex
//
//  Created by Sejmet on 18/06/2022.
//

import SwiftUI

struct PokemonDetailView: View {
    @ObservedObject var viewModel: PokemonDetailViewModel
    
    var body: some View {
        VStack {
            
        }
        .navigationBar(navBarTitle: viewModel.pokemon?.name ?? "")
    }
}

struct PokemonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailView(viewModel: PokemonDetailViewModel(pokeId: 1, goBack: {}))
    }
}
