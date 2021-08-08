//
//  SingleItemView.swift
//  RougueLike
//
//  Created by Erdem Senol on 2.08.2021.
//

import SwiftUI

struct SingleItemView: View {
    @ObservedObject var viewModel: BattleScreenViewModel
    
    var body: some View {
        ZStack{
            Image(viewModel.item.background)
                .resizable()
                .scaledToFill()
                .frame(width: 180, height: 240)
                .cornerRadius(28)
                .shadow(color: .black.opacity(0.6), radius: 8, x: 0, y: 8)
            VStack {
                Image(viewModel.item.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                Text(viewModel.item.name)
                    .bold()
                    .font(.system(size: 22, weight: .bold, design: .monospaced))
                    .padding(.top, -35)
                Text("(\(viewModel.item.rarity))")
                    .bold()
                    .font(.system(size: 22, weight: .bold, design: .monospaced))
                    .padding(.top, -30)
                Text(viewModel.item.power)
                    .bold()
                    .font(.system(size: 22, weight: .bold, design: .monospaced))
                    .frame(width: 140, height: 100)
                    .multilineTextAlignment(.center)
                    .padding(.top, -35)
            }.foregroundColor(.white)
        }
    }
}

struct SingleItemView_Previews: PreviewProvider {
    static var previews: some View {
        SingleItemView(viewModel: BattleScreenViewModel())
    }
}
