//
//  HeroStatsView.swift
//  RougueLike
//
//  Created by Erdem Senol on 23.07.2021.
//

import SwiftUI

struct HeroStatsView: View {
    @ObservedObject var viewModel: BattleScreenViewModel
    
    var body: some View {
        HStack{
            Image("2")
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
                .frame(width: 120, height: 120)

            VStack{
                Rectangle()
                    .fill(Color.red)
                    .frame(height: 50)

                HStack{
                    Circle()
                        .fill(viewModel.mana >= 1 ? Color.blue : Color.gray)
                        .frame(width: 20, height: 20)
                    Circle()
                        .fill(viewModel.mana >= 2 ? Color.blue : Color.gray)
                        .frame(width: 20, height: 20)
                    Circle()
                        .fill(viewModel.mana == 3 ? Color.blue : Color.gray)
                        .frame(width: 20, height: 20)
                }
                    
            }.padding(.trailing, 8)
        }.frame(width: UIScreen.main.bounds.width, height: 100)
    }
}

struct HeroStatsView_Previews: PreviewProvider {
    static var previews: some View {
        HeroStatsView(viewModel: BattleScreenViewModel())
            .previewLayout(.sizeThatFits)
    }
}
