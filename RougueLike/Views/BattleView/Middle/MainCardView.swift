//
//  MainCardView.swift
//  RougueLike
//
//  Created by Erdem Senol on 23.07.2021.
//

import SwiftUI

struct MainCardView: View {
    @Binding var card: Card
    @Binding var tapped: Bool
    @ObservedObject var viewModel: BattleScreenViewModel
    
    var columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var body: some View {
        ZStack{
            LazyVGrid(columns: columns, spacing: 8) {
                ForEach(cards) { card in
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.black.opacity(0.42))
                        .frame(width: 80, height: 100)
                        .onTapGesture {
                            if !viewModel.comboInterval{
                                self.card = card
                                withAnimation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0.25)){
                                    self.tapped = true
                                }
                            }
                        }
                        .overlay(Text(card.name))
                }
            }
        }
    }
}

struct MainCardView_Previews: PreviewProvider {
    static var previews: some View {
        MainCardView(card: .constant(cards[0]), tapped: .constant(false), viewModel: BattleScreenViewModel())
    }
}
