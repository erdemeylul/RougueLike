//
//  SingleCardView.swift
//  RougueLike
//
//  Created by Erdem Senol on 23.07.2021.
//

import SwiftUI

struct SingleCardView: View {
   
    @ObservedObject var viewModel: BattleScreenViewModel

    var body: some View {
        VStack {
            Button(action: {
                let random = Double.random(in: 0.5..<2)
                viewModel.comboInterval = true
                viewModel.mana -= 1
                DispatchQueue.main.asyncAfter(deadline: .now() + random) {
                    withAnimation(.interpolatingSpring(stiffness: 40, damping: 5)){
                        viewModel.hit = true
                        viewModel.showNumber = true
                        viewModel.trimAmount -= CGFloat( Double(viewModel.card.attack) / Double(viewModel.monster.life))
                    }
                }

                viewModel.tapped = false
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3 + random) {
                    withAnimation(.default){
                        viewModel.hit = false
                        viewModel.comboInterval = false
                    }
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.8 + random) {
                    withAnimation(.default){
                        viewModel.showNumber = false
                    }
                }
                print("Card \(viewModel.comboInterval)")
            }, label: {
                Text(viewModel.mana > 0 ? "USE" : "OUT OF MANA")
                    .bold()
                    .foregroundColor(.white)
                    .frame(width: 120, height: 40)
                    .background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .topLeading, endPoint: .bottomTrailing))
                    .clipShape(RoundedRectangle(cornerRadius: 18))
                    .shadow(color: .purple, radius: 10, x: 0.0, y: 0.0)
            }).disabled(viewModel.mana > 0 ? false : true)
            ZStack(alignment: .top) {
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.purple)
                    .frame(width: 320, height: UIScreen.main.bounds.height - 400)
                VStack {
                    Image(viewModel.card.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 260, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    Text(viewModel.card.name)
                    Text(viewModel.card.tooltip)
                }.onTapGesture {
                    viewModel.tapped = false
                }
            }
        }
    }
}

struct SingleCardView_Previews: PreviewProvider {
    static var previews: some View {
        SingleCardView(viewModel: BattleScreenViewModel())
    }
}
