//
//  NavigationBarWithBackModifier.swift
//  Pokedex
//
//  Created by Sejmet on 18/06/2022.
//

import SwiftUI

struct NavigationBarWithBackModifier: ViewModifier {
    var navBarTitle: String
    var goBack: () -> Void
    
    func body(content: Content) -> some View {
        content
            .navigationTitle(navBarTitle)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: Button(action: {
                goBack()
            }) {
                Image("Back_Icon")
            })
    }
}

extension View {
    func navigationBarWithBack(navBarTitle: String, goBack: @escaping () -> Void) -> some View {
        self.modifier(NavigationBarWithBackModifier(navBarTitle: navBarTitle, goBack: goBack))
    }
}

