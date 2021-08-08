//
//  CircleButtonAnimationView.swift
//  CryptoApp
//
//  Created by Erdem Senol on 9.07.2021.
//

import SwiftUI

struct CircleButtonAnimationView: View {
    @ObservedObject var viewModel: BattleScreenViewModel
    
    var body: some View {
        RoundedRectangle(cornerRadius: 12)
            .stroke(lineWidth: 5)
            .scale(viewModel.cardAnimation ? 1.5 : 1)
            .opacity(viewModel.cardAnimation ? 0.0 : 1.0)
            .animation(viewModel.cardAnimation ? Animation.easeOut(duration: 1.0) : .none)
    }
}

