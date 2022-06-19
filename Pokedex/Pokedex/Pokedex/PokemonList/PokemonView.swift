//
//  PokemonView.swift
//  Pokedex
//
//  Created by Sejmet on 18/06/2022.
//

import SwiftUI

struct PokemonView: View {
    let pokemon: Pokemon
    
    var body: some View {
        HStack {
            Text("#\(pokemon.id ?? 0)")
                .font(Font.system(size: 20))
                .foregroundColor(Color.black)
            
            Text(pokemon.name ?? "")
                .font(Font.system(size: 20))
                .foregroundColor(Color.black)
        }
        .padding(.vertical, 10)
    }
}

struct PokemonView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonView(pokemon: Pokemon())
    }
}
