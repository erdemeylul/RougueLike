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
        ZStack(alignment: .bottom) {
            
            ZStack{
                Image(viewModel.card.background)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 220, height: 280)
                    .cornerRadius(28)
                    .shadow(color: .black.opacity(0.6), radius: 8, x: 0, y: 8)

                VStack {
                    Image(viewModel.card.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 120, height: 120)
                    Text(viewModel.card.name)
                        .bold()
                        .font(.system(size: 22, weight: .bold, design: .monospaced))
                        .padding(.top, -35)
                    Text(viewModel.card.tooltip)
                        .bold()
                        .font(.system(size: 22, weight: .bold, design: .monospaced))
                        .frame(width: 140, height: 100)
                        .multilineTextAlignment(.center)
                        .padding(.top, -35)
                }.foregroundColor(.black)
            }
            .onTapGesture {
                viewModel.tapped = false
                viewModel.card = examplecard
            }
            
//            Button(action: {
//                let random = Double.random(in: 0.5..<2)
//                viewModel.comboInterval = true
//                viewModel.mana -= 1
//                DispatchQueue.main.asyncAfter(deadline: .now() + random) {
//                    withAnimation(.interpolatingSpring(stiffness: 40, damping: 5)){
//                        viewModel.hit = true
//                        viewModel.showNumber = true
//                        viewModel.trimAmount -= CGFloat( Double(viewModel.card.attack) / Double(viewModel.monster.constantLife))
//                        viewModel.monster.life -= viewModel.card.attack
//                    }
//                }
//                
//                viewModel.tapped = false
//                
//                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3 + random) {
//                    withAnimation(.default){
//                        viewModel.hit = false
//                        viewModel.comboInterval = false
//                        if viewModel.mana == 0{
//                            viewModel.buttonShow = true
//                        }
//                    }
//                }
//                DispatchQueue.main.asyncAfter(deadline: .now() + 0.8 + random) {
//                    withAnimation(.default){
//                        viewModel.showNumber = false
//                    }
//                }
//                DispatchQueue.main.asyncAfter(deadline: .now() + 1.1 + random) {
//                    withAnimation(.default){
//                        viewModel.card = examplecard
//                    }
//                }
//            }, label: {
//                Text(viewModel.mana > 0 ? "USE" : "OUT OF MANA")
//                    .bold()
//                    .foregroundColor(.white)
//                    .frame(width: 120, height: 40)
//                    .background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .topLeading, endPoint: .bottomTrailing))
//                    .clipShape(RoundedRectangle(cornerRadius: 18))
//                    .shadow(color: .purple, radius: 10, x: 0.0, y: 0.0)
//            }).disabled(viewModel.mana > 0 ? false : true)
//            .padding()
        }
    }
}

struct SingleCardView_Previews: PreviewProvider {
    static var previews: some View {
        SingleCardView(viewModel: BattleScreenViewModel())
    }
}
