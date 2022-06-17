//
//  PokedexApp.swift
//  Pokedex
//
//  Created by Sejmet on 14/06/2022.
//

import SwiftUI

@available(iOS 14.0, *)
struct PokedexApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            AppCoordinator()
        }
    }
}
