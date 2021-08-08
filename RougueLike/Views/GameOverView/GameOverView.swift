//
//  GameOverView.swift
//  RougueLike
//
//  Created by Erdem Senol on 7.08.2021.
//

import SwiftUI

struct GameOverView: View {
    @Environment(\.presentationMode) var mode
    @EnvironmentObject var viewModel: BattleScreenViewModel

    var body: some View {
        VStack {
            Text("GAME OVER")
            Text(viewModel.hero.life <= 0 ? "Your life has expired!" : "You are out of cards!")
            HStack{
                Button(action: {
                    mode.wrappedValue.dismiss()
                }, label: {
                    Text("Resurrect")
                })
                Button(action: {
                    mode.wrappedValue.dismiss()
                }, label: {
                    Text("Fresh Run")
                })
            }
        }
    }
}

struct GameOverView_Previews: PreviewProvider {
    static var previews: some View {
        GameOverView()
            .environmentObject(BattleScreenViewModel())
    }
}
