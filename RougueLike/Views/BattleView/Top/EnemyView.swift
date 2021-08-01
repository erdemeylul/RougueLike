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
                    .stroke(viewModel.combo ? Color.orange : Color.red ,style: StrokeStyle(lineWidth: 20, lineCap: .round))
                    .padding(.horizontal, 6)
            }
    
            
            Image("monster")
                .resizable()
                .scaledToFit()
                .frame(width: isAnimating ? 155 : 160, height: isAnimating ? 172 : 180)
                .offset(y: isAnimating ? 4 : 0)
                .animation(Animation.linear(duration: 0.7).repeatForever())
                .onAppear {
                    self.isAnimating = true
                }
        }.frame(width: UIScreen.main.bounds.width, height:  UIScreen.main.bounds.width)
    }
}

struct EnemyView_Previews: PreviewProvider {
    static var previews: some View {
        EnemyView(viewModel: BattleScreenViewModel())
    }
}
