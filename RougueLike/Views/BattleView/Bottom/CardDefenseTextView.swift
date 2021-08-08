//
//  CardDefenseTextView.swift
//  RougueLike
//
//  Created by Erdem Senol on 1.08.2021.
//

import SwiftUI

struct CardDefenseTextView: View {
    @ObservedObject var viewModel: BattleScreenViewModel
    
    var body: some View {
        Text("\(viewModel.monster.attack)")
            .bold()
            .font(.title)
            .foregroundColor(.white)
            .scaleEffect(viewModel.heroShowNumber ? 1 : 0.1)
            .opacity(viewModel.heroShowNumber ? 0.8 : 0)
            .offset(x: viewModel.heroShowNumber ? 40 : 35, y: viewModel.heroShowNumber ? -110 : -100)
            .animation(Animation.interpolatingSpring(stiffness: 25, damping: 5, initialVelocity: 20).delay(0.3))
    }
}

struct CardDefenseTextView_Previews: PreviewProvider {
    static var previews: some View {
        CardDefenseTextView(viewModel: BattleScreenViewModel())
    }
}
