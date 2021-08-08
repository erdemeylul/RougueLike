//
//  EndTurnButtonView.swift
//  RougueLike
//
//  Created by Erdem Senol on 1.08.2021.
//

import SwiftUI

struct EndTurnButtonView: View {
    @ObservedObject var viewModel = BattleScreenViewModel()
    
    var body: some View {
        ZStack {
            Button(action: {
                viewModel.lastStand = true
                
                viewModel.slide.toggle()
                viewModel.endTurn = true
                
                let random = Double.random(in: 1..<2.5)
                viewModel.heroComboInterval = true
                viewModel.buttonShow = false
                viewModel.endDefense = true

                DispatchQueue.main.asyncAfter(deadline: .now() + random) {
                    withAnimation(.interpolatingSpring(stiffness: 40, damping: 5)){
                        viewModel.heroHit = true
                        viewModel.heroShowNumber = true
                        viewModel.heroTrimAmount -= CGFloat( Double(viewModel.monster.attack) / Double(viewModel.hero.constantLife))
                        viewModel.hero.life -= viewModel.monster.attack
                    }
                }

                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3 + random) {
                    withAnimation(.default){
                        viewModel.heroHit = false
                        viewModel.heroComboInterval = false
                    }
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.8 + random) {
                    withAnimation(.default){
                        viewModel.heroShowNumber = false
                    }
                }
            }, label: {
                Text("STAND")
                    .fontWeight(.heavy)
                    .padding()
                    .foregroundColor(.black)
                    .background(RoundedRectangle(cornerRadius: 12).fill(Color.white))
            }).opacity(viewModel.mana == 0 && !viewModel.comboInterval && !viewModel.endTurn && viewModel.buttonShow && viewModel.monster.life > 0 && viewModel.remainingCards.count == 4 ? 1 : 0)
            
            Button(action: {
                viewModel.slide.toggle()
                
                viewModel.endTurn = true
                
                
                let random = Double.random(in: 1..<2.5)
                viewModel.heroComboInterval = true
                viewModel.buttonShow = false
                viewModel.endDefense = true
                viewModel.remainingCards = Array(Set(cards).subtracting(viewModel.turnCards))
                DispatchQueue.main.asyncAfter(deadline: .now() + random) {
                    withAnimation(.interpolatingSpring(stiffness: 40, damping: 5)){
                        viewModel.heroHit = true
                        viewModel.heroShowNumber = true
                        viewModel.heroTrimAmount -= CGFloat( Double(viewModel.monster.attack) / Double(viewModel.hero.constantLife))
                        viewModel.hero.life -= viewModel.monster.attack
                        if viewModel.hero.life <= 0{
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5 + random) {
                                withAnimation(.default){
                                    viewModel.deadOrAlive = true
                                }
                            }
                        }
                    }
                }

                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3 + random) {
                    withAnimation(.default){
                        viewModel.heroHit = false
                        viewModel.heroComboInterval = false
                    }
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.8 + random) {
                    withAnimation(.default){
                        viewModel.heroShowNumber = false
                    }
                }
            }, label: {
                Text("DEFEND")
                    .fontWeight(.heavy)
                    .padding()
                    .foregroundColor(.black)
                    .background(RoundedRectangle(cornerRadius: 12).fill(Color.white))
        }).opacity(viewModel.mana == 0 && !viewModel.comboInterval && !viewModel.endTurn && viewModel.buttonShow && viewModel.monster.life > 0 && viewModel.remainingCards.count > 4 ? 1 : 0)
        }
    }
}

struct EndTurnButtonView_Previews: PreviewProvider {
    static var previews: some View {
        EndTurnButtonView(viewModel: BattleScreenViewModel())
    }
}
