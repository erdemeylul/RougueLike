//
//  HeroCardView.swift
//  RougueLike
//
//  Created by Erdem Senol on 1.08.2021.
//

import SwiftUI

struct HeroCardView: View {
    @State var startingOffsetY: CGFloat = UIScreen.main.bounds.height * 0.86
    @State var currentDragOffsetY: CGFloat = 0
    @State var endingDragOffsetY: CGFloat = 0
    @State var showTitle = false
    
    var body: some View {
        VStack {
            VStack{
                VStack {
                    Image(systemName: "chevron.up")
                        .padding()
                        .background(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)).opacity(0.4))
                        .cornerRadius(12)
                        .rotationEffect(Angle(degrees: showTitle ? 180 : 0))
                }
                //HeroStatsView(viewModel: viewModel)
                CollectiblesView()
            }
        }
        .frame(width: UIScreen.main.bounds.width)
        .background(Color(#colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)))
        .cornerRadius(30)
        .offset(y: startingOffsetY)
        .offset(y: currentDragOffsetY)
        .offset(y: endingDragOffsetY)
        .gesture(
            DragGesture()
                .onChanged{ value in
                    withAnimation(.spring()){
                        currentDragOffsetY = value.translation.height
                    }
                }.onEnded{ value in
                    withAnimation(.spring()) {
                        if currentDragOffsetY < -150{
                            endingDragOffsetY = -startingOffsetY
                            currentDragOffsetY = 0
                            showTitle = true
                        }else if endingDragOffsetY != 0 && currentDragOffsetY > 150 {
                            endingDragOffsetY = 0
                            currentDragOffsetY = 0
                            showTitle = false
                        }
                        else{
                            currentDragOffsetY = 0
                        }
                    }
                }
        )
    }
}

struct HeroCardView_Previews: PreviewProvider {
    static var previews: some View {
        HeroCardView()
    }
}
