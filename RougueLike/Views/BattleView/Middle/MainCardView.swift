//
//  MainCardView.swift
//  RougueLike
//
//  Created by Erdem Senol on 23.07.2021.
//

import SwiftUI

struct MainCardView: View {
    @ObservedObject var viewModel: BattleScreenViewModel
    
    var columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var body: some View {
        ZStack{
            LazyVGrid(columns: columns, spacing: 80) {
                ForEach(viewModel.remainingCards.prefix(4)) { card in
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.orange)
                        .frame(width: 80, height: 80)
                        .onTapGesture {
                            viewModel.card = card
                            if !viewModel.usedCards.contains(card){
                                let random = Double.random(in: 0.5..<2)
                                viewModel.comboInterval = true
                                viewModel.mana -= 1
                                viewModel.usedCards.append(card)
                                viewModel.cardAnimation = true

                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                    viewModel.cardAnimation = true
                                }
                                DispatchQueue.main.asyncAfter(deadline: .now() + random) {
                                    withAnimation(.interpolatingSpring(stiffness: 40, damping: 5)){
                                        viewModel.hit = true
                                        viewModel.showNumber = true
                                        viewModel.trimAmount -= CGFloat( Double(viewModel.card.attack) / Double(viewModel.monster.constantLife))
                                        viewModel.monster.life -= viewModel.card.attack
                                    }
                                }
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3 + random) {
                                    withAnimation(.default){
                                        viewModel.hit = false
                                        viewModel.comboInterval = false
                                        if viewModel.mana == 0{
                                            viewModel.buttonShow = true
                                        }
                                    }
                                }
                                
                                 DispatchQueue.main.asyncAfter(deadline: .now() + 0.8 + random) {
                                     withAnimation(.default){
                                         viewModel.showNumber = false
                                     }
                                 }
//                                 DispatchQueue.main.asyncAfter(deadline: .now() + 2 + random) {
//                                     withAnimation(.default){
//                                         viewModel.card = examplecard
//                                     }
//                                 }
                            }
                        }
                        .onLongPressGesture {
                            if !viewModel.comboInterval{
                                viewModel.card = card
                                
                                viewModel.tapped = true
                            }
                        }
                        
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(lineWidth: 5)
                                .scale(viewModel.cardAnimation && viewModel.card.id == card.id && !viewModel.tapped ? 1.5 : 1)
                                .opacity(viewModel.cardAnimation && viewModel.card.id == card.id && !viewModel.tapped || viewModel.usedCards.contains(card) ? 0.0 : 1.0)
                                .animation(viewModel.cardAnimation && viewModel.card.id == card.id && !viewModel.tapped ? Animation.easeOut(duration: 0.3) : .none)
                        )
                        
                        .rotationEffect(.degrees(45))
                        .overlay(Text(card.name))
                        .onAppear{
                            viewModel.turnCards.append(card)
                        }
                }
            }
        }
    }
}

struct MainCardView_Previews: PreviewProvider {
    static var previews: some View {
        MainCardView(viewModel: BattleScreenViewModel())
    }
}
