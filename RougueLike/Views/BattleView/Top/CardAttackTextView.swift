//
//  CardAttackTextView.swift
//  RougueLike
//
//  Created by Erdem Senol on 1.08.2021.
//

import SwiftUI

struct CardAttackTextView: View {
    @ObservedObject var viewModel: BattleScreenViewModel
    var body: some View {
        Text("\(viewModel.card.attack)")
            .bold()
            .font(.title)
            .foregroundColor(.white)
            .scaleEffect(viewModel.showNumber ? 1 : 0.1)
            .opacity(viewModel.showNumber ? 0.8 : 0)
            .offset(x: viewModel.showNumber ? 40 : 35, y: viewModel.showNumber ? -110 : -100)
            .animation(viewModel.showNumber ? Animation.interpolatingSpring(stiffness: 25, damping: 5, initialVelocity: 20).delay(0.3) : .none)
    }
}

struct CardAttackTextView_Previews: PreviewProvider {
    static var previews: some View {
        CardAttackTextView(viewModel: BattleScreenViewModel())
    }
}
