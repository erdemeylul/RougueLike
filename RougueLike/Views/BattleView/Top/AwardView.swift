//
//  AwardView.swift
//  RougueLike
//
//  Created by Erdem Senol on 1.08.2021.
//

import SwiftUI

struct AwardView: View {
    @ObservedObject var viewModel: BattleScreenViewModel
    
    var body: some View {
        VStack {
            ZStack {
                ZStack{
                    Circle()

                    Circle()
                        .stroke(Color.white, lineWidth: 4)
                        .frame(width: 200, height: 200)
                        
                        .overlay(
                            Rectangle()
                                .fill(Color.white)
                                .frame(width: 20, height: 4)
                                .offset(x: 110)
                                .rotationEffect(Angle(degrees: viewModel.turnWheel ? viewModel.angle : 0))
                                .animation(Animation.interpolatingSpring(stiffness: 40, damping: 5))
                        )
                    
                    Image(awards[0].image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                        .offset(x: 150, y: 0)
                    
                    Image(awards[1].image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                        .offset(x: 100, y: 110)
                    
                    Image(awards[2].image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                        .offset(x: 0, y: 150)

                    Image(awards[3].image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                        .offset(x: -100, y: 110)
                    
                    Image(awards[4].image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                        .offset(x: -150, y: 0)

                    Image(awards[5].image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                        .offset(x: -100, y: -110)

                    Image(awards[6].image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                        .offset(x: 0, y: -150)

                    Image(awards[7].image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                        .offset(x: 100, y: -110)
                        
                }
                
                if let final = viewModel.selectedAward{
                    Image(final.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                        .clipShape(Circle())
                }
            }
        }
    }
}

struct AwardView_Previews: PreviewProvider {
    static var previews: some View {
        AwardView(viewModel: BattleScreenViewModel())
            .previewLayout(.sizeThatFits)
    }
}
