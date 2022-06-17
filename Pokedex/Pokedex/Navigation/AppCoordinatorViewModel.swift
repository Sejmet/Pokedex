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
    
}
