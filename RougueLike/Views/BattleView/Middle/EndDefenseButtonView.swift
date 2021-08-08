//
//  EndDefenseButtonView.swift
//  RougueLike
//
//  Created by Erdem Senol on 1.08.2021.
//

import SwiftUI

struct EndDefenseButtonView: View {
    @ObservedObject var viewModel: BattleScreenViewModel
    
    var body: some View {
        Button(action: {
            viewModel.slide.toggle()
                    viewModel.endTurn = false
            viewModel.mana = 3
            viewModel.endDefense = false
        }, label: {
            Text("ATTACK")
                .fontWeight(.heavy)
                .padding()
                .foregroundColor(.black)
                .background(RoundedRectangle(cornerRadius: 12).fill(Color.white))
        }).opacity(viewModel.endTurn && !viewModel.heroComboInterval && viewModel.endDefense && viewModel.monster.life > 0 && viewModel.remainingCards != [] && !viewModel.heroDead ? 1 : 0)
    }
}

struct EndDefenseButtonView_Previews: PreviewProvider {
    static var previews: some View {
        EndDefenseButtonView(viewModel: BattleScreenViewModel())
    }
}
