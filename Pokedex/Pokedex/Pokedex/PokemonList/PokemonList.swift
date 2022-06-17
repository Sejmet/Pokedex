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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct PokemonList_Previews: PreviewProvider {
    static var previews: some View {
        PokemonList(viewModel: PokemonListViewModel())
    }
}
