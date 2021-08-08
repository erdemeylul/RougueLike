//
//  ComboDefenseTextView.swift
//  RougueLike
//
//  Created by Erdem Senol on 1.08.2021.
//

import SwiftUI

struct ComboDefenseTextView: View {
    @ObservedObject var viewModel: BattleScreenViewModel
    
    var body: some View {
        Text("+ \(viewModel.hero.defenseCombo[0])")
            .font(.title)
            .foregroundColor(.green)
            .scaleEffect(viewModel.heroCombo ? 1 : 0.2)
            .opacity(viewModel.heroCombo ? 1 : 0)
            .offset(x: viewModel.heroCombo ? 40 : 0, y: viewModel.heroCombo ? -100 : 0)
            .animation(Animation.interpolatingSpring(stiffness: 25, damping: 5, initialVelocity: 10).delay(0.3))
    }
}

struct ComboDefenseTextView_Previews: PreviewProvider {
    static var previews: some View {
        ComboDefenseTextView(viewModel: BattleScreenViewModel())
    }
}
