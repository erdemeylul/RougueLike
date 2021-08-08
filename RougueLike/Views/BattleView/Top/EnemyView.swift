//
//  EnemyView.swift
//  RougueLike
//
//  Created by Erdem Senol on 23.07.2021.
//

import SwiftUI

struct EnemyView: View {
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
                    .trim(from: 0.0, to: viewModel.trimAmount)
                    .stroke(viewModel.combo ? Color.orange : Color.red ,style: StrokeStyle(lineWidth: 14, lineCap: .round))
                    .padding(.horizontal, 6)
            }.opacity(viewModel.monsterDead ? 0 : 1)
            .animation(.easeInOut(duration: 1.2))

    
            
            VStack {
                Image(viewModel.monster.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: isAnimating ? 155 : 160, height: isAnimating ? 172 : 180)
                    .offset(y: isAnimating ? 4 : 0)
                    .animation(Animation.linear(duration: 0.7).repeatForever())
                    .onAppear {
                        self.isAnimating = true
                    }
                Text(viewModel.monster.life > 0 ? "\(viewModel.monster.life)/\(viewModel.monster.constantLife)" : "0/\(viewModel.monster.constantLife)")
                    .font(.system(size: 24, weight: .bold, design: .monospaced))
            }.scaleEffect(viewModel.monsterDead ? 0 : 1)
            .animation(.easeInOut(duration: 1.5))
        }.frame(width: UIScreen.main.bounds.width, height:  UIScreen.main.bounds.width)
    }
}

struct EnemyView_Previews: PreviewProvider {
    static var previews: some View {
        EnemyView(viewModel: BattleScreenViewModel())
    }
}
