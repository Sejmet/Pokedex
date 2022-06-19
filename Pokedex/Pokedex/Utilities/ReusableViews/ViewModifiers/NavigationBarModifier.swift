//
//  NavigationBarModifier.swift
//  Pokedex
//
//  Created by Sejmet on 18/06/2022.
//

import SwiftUI

struct NavigationBarModifier: ViewModifier {
    var navBarTitle: String
    
    func body(content: Content) -> some View {
        content
            .navigationTitle(navBarTitle)
            .navigationBarTitleDisplayMode(.large)
            .navigationBarBackButtonHidden(true)
    }
}

extension View {
    func navigationBar(navBarTitle: String) -> some View {
        self.modifier(NavigationBarModifier(navBarTitle: navBarTitle))
    }
}
