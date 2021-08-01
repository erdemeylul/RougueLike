//
//  RougueLikeApp.swift
//  RougueLike
//
//  Created by Erdem Senol on 23.07.2021.
//

import SwiftUI

@main
struct RougueLikeApp: App {
    @State var viewModel = BattleScreenViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
