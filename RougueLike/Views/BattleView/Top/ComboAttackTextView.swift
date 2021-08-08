//
//  CardAttackTextView.swift
//  RougueLike
//
//  Created by Erdem Senol on 1.08.2021.
//

import SwiftUI

struct ComboAttackTextView: View {
    @ObservedObject var viewModel: BattleScreenViewModel
    
    var body: some View {
        if viewModel.card.comboEffect != 0 {
            Text("\(viewModel.card.comboEffect)")
                .font(.title)
                .foregroundColor(.orange)
                .scaleEffect(viewModel.combo ? 1 : 0.2)
                .opacity(viewModel.combo ? 1 : 0)
                .offset(x: viewModel.combo ? 40 : 0, y: viewModel.combo ? -100 : 0)
                .animation(Animation.interpolatingSpring(stiffness: 25, damping: 5, initialVelocity: 10).delay(0.3))
        }
    }
}

struct ComboAttackTextView_Previews: PreviewProvider {
    static var previews: some View {
        ComboAttackTextView(viewModel: BattleScreenViewModel())
    }
}
