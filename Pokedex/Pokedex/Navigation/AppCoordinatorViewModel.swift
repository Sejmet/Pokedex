//
//  AppCoordinatorViewModel.swift
//  Pokedex
//
//  Created by Sejmet on 17/06/2022.
//

import SwiftUI
import Combine
import FlowStacks

class AppCoordinatorViewModel: ObservableObject {
    @Published var routes: Routes<Screen> = []
    
    init() {
        routes = [.root(.pokemonsList(.init()), embedInNavigationView: true)]
        
    }
    
    private func dismiss() {
        routes.dismiss()
    }
    
    private func goBack() {
        routes.goBack()
    }
    
    private func goBackToRoot() {
        routes.goBackToRoot()
    }
}
