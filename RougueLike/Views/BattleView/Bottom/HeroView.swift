//
//  HeroView.swift
//  RougueLike
//
//  Created by Erdem Senol on 31.07.2021.
//

import SwiftUI

struct HeroView: View {
    @ObservedObject var viewModel: BattleScreenViewModel
    
    @State var isAnimating = false
    
    var body: some View {
        ZStack{
            ZStack {
                Circle()
                    .trim(from: 0.0, to: 1.0)
                    .stroke(Color.red.opacity(0.3), lineWidth: 20)
                    .padding(.horizontal, 6)
                Circle()
                    .trim(from: 0.0, to: viewModel.heroTrimAmount)
                    .stroke(viewModel.heroCombo ? Color.green : Color.red ,style: StrokeStyle(lineWidth: 14, lineCap: .round))
                    .padding(.horizontal, 6)
            }.opacity(viewModel.heroDead ? 0 : 1)
            .animation(.easeInOut(duration: 1.2))
    
            
            VStack {
                Text("\(viewModel.remainingCards.count)/\(cards.count)")
                    .font(.system(size: 12, weight: .bold, design: .monospaced))
                Image("hero")
                    .resizable()
                    .scaledToFit()
                    .frame(width: isAnimating ? 155 : 160, height: isAnimating ? 172 : 180)
                    .offset(y: isAnimating ? 4 : 0)
                    .animation(Animation.linear(duration: 0.7).repeatForever())
                    .onAppear {
                        self.isAnimating = true
                    }
                Text("\(viewModel.hero.life)/\(viewModel.hero.constantLife)")
                    .font(.system(size: 24, weight: .bold, design: .monospaced))
            }.scaleEffect(viewModel.heroDead ? 0 : 1)
            .animation(.easeInOut(duration: 1.5))
        }.frame(width: UIScreen.main.bounds.width, height:  UIScreen.main.bounds.width)
    }
}

struct HeroView_Previews: PreviewProvider {
    static var previews: some View {
        HeroView(viewModel: BattleScreenViewModel())
    }
}
