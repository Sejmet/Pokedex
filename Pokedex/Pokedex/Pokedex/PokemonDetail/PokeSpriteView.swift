//
//  PokeSpriteView.swift
//  Pokedex
//
//  Created by Sejmet on 19/06/2022.
//

import SwiftUI
import Kingfisher

struct PokeSpriteView: View {
    let urlString: String
    let text: String
    
    var body: some View {
        VStack {
            if let url = URL(string: urlString) {
                KFImage(url)
                
                Text(text)
            }
        }
    }
}

struct PokeSpriteView_Previews: PreviewProvider {
    static var previews: some View {
        PokeSpriteView(urlString: "", text: "")
    }
}
