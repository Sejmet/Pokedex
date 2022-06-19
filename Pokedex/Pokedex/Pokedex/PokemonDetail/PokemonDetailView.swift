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
        List {
            ScrollView(.horizontal) {
                HStack {
                    PokeSpriteView(urlString: viewModel.pokemon?.sprites?.frontDefault ?? "", text: "Male Front")
                    
                    PokeSpriteView(urlString: viewModel.pokemon?.sprites?.backDefault ?? "", text: "Male Back")
                    
                    PokeSpriteView(urlString: viewModel.pokemon?.sprites?.frontFemale ?? "", text: "Female Front")
                    
                    PokeSpriteView(urlString: viewModel.pokemon?.sprites?.backFemale ?? "", text: "Female Back")
                    
                    PokeSpriteView(urlString: viewModel.pokemon?.sprites?.frontShiny ?? "", text: "Shiny Front")
                    
                    PokeSpriteView(urlString: viewModel.pokemon?.sprites?.backShiny ?? "", text: "Shiny Back")
                }
            }
    
            ForEach(viewModel.pokemon?.stats ?? []) { stat in
                HStack(spacing: 6) {
                    Text("\(stat.info?.name ?? ""):")
                    
                    Text("\(stat.baseStat ?? 0)")
                }
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
        .navigationBarWithBack(navBarTitle: viewModel.pokemon?.name ?? "", goBack: viewModel.goBack)
    }
}

struct PokemonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailView(viewModel: PokemonDetailViewModel(pokeId: 1, goBack: {}))
    }
}
