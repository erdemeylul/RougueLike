//
//  HeroSheetView.swift
//  RougueLike
//
//  Created by Erdem Senol on 23.07.2021.
//

import SwiftUI

struct HeroSheetView: View {
    @EnvironmentObject var viewModel: BattleScreenViewModel
    

    //hero card
    @State var startingOffsetY: CGFloat = UIScreen.main.bounds.height * 0.86
    @State var currentDragOffsetY: CGFloat = 0
    @State var endingDragOffsetY: CGFloat = 0
    @State var showTitle = false

    
    //make cards slide into screen
    @State var slide: Bool = false
    

    
    var body: some View {
        ZStack {
                VStack{
                    VStack{
                        EnemyView(viewModel: viewModel)
                            .padding(.bottom, 40)
                            .overlay(
                                Image("exclamation")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50, height: 80)
                                    .opacity(viewModel.wrongCombo ? 1 : 0)
                                    .padding()
                                ,alignment: .top
                            )
                            .overlay(
                                Button(action: {
                                    self.slide.toggle()
                                    
                                    withAnimation(.default){
                                        viewModel.endTurn = true
                                    }
                                }, label: {
                                    Text("ENDTURN")
                                        .fontWeight(.heavy)
                                        .padding()
                                        .foregroundColor(.black)
                                        .background(RoundedRectangle(cornerRadius: 12).fill(Color.white))
                                }).opacity(viewModel.mana == 0 && !viewModel.comboInterval && !viewModel.endTurn ? 1 : 0)
                                ,alignment: .bottomTrailing
                            )
                            .overlay(
                                Button(action: {
                                    self.slide.toggle()
                                        withAnimation(.default){
                                            viewModel.endTurn = false
                                        }
                                        viewModel.mana = 3
                                }, label: {
                                    Text("ENDTURN")
                                        .fontWeight(.heavy)
                                        .padding()
                                        .foregroundColor(.black)
                                        .background(RoundedRectangle(cornerRadius: 12).fill(Color.white))
                                }).opacity(viewModel.endTurn && !viewModel.comboInterval && viewModel.endDefense ? 1 : 0)
                                ,alignment: .bottomLeading
                            )
                            .overlay(
                                Image("slash")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 200, height: 100)
                                    .opacity(viewModel.hit ? 1 : 0)
                            )
                            .overlay(
                                Text("\(viewModel.card.attack)")
                                    .bold()
                                    .font(.title)
                                    .foregroundColor(.white)
                                    .scaleEffect(viewModel.showNumber ? 1 : 0.1)
                                    .opacity(viewModel.showNumber ? 0.8 : 0)
                                    .offset(x: viewModel.showNumber ? 40 : 35, y: viewModel.showNumber ? -110 : -100)
                                    .animation(Animation.interpolatingSpring(stiffness: 25, damping: 5, initialVelocity: 20).delay(0.3))
                            )
                            .overlay(
                                Text("\(viewModel.card.comboEffect)")
                                    .font(.title)
                                    .foregroundColor(.orange)
                                    .scaleEffect(viewModel.combo ? 1 : 0.2)
                                    .opacity(viewModel.combo ? 1 : 0)
                                    .offset(x: viewModel.combo ? 40 : 0, y: viewModel.combo ? -100 : 0)
                                    .animation(Animation.interpolatingSpring(stiffness: 25, damping: 5, initialVelocity: 10).delay(0.3))
                            )
                    }
                    .background(Color.black.opacity(0.000001))
                    .onTapGesture {
                        if viewModel.hit && viewModel.comboInterval{
                            viewModel.combo = true
                            viewModel.trimAmount -= CGFloat( Double(viewModel.card.comboEffect) / Double(viewModel.monster.life))
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                                withAnimation(.default){
                                    viewModel.combo = false
                                }
                            }

                        }else{
                            viewModel.comboInterval = false
                            
                            viewModel.wrongCombo = true
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                                withAnimation(.default){
                                    viewModel.wrongCombo = false
                                }
                            }
                        }
                    }

                    
                    
                    if viewModel.endTurn{
                        MainCardView(card: $viewModel.card, tapped: $viewModel.tapped, viewModel: viewModel)
                            .offset(x: slide ? 0 : 500)
                            .animation(Animation.interpolatingSpring(stiffness: 40, damping: 5).delay(0.3))
                    }else{
                        VStack {
                            HeroView(viewModel: viewModel)
                                .overlay(
                                    Image("exclamation")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 50, height: 80)
                                        .opacity(viewModel.wrongCombo ? 1 : 0)
                                        .padding()
                                    ,alignment: .top
                                )

                                .overlay(
                                    Image("slash")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 200, height: 100)
                                        .opacity(viewModel.hit ? 1 : 0)
                                )
                                .overlay(
                                    Text("\(viewModel.card.attack)")
                                        .bold()
                                        .font(.title)
                                        .foregroundColor(.white)
                                        .scaleEffect(viewModel.showNumber ? 1 : 0.1)
                                        .opacity(viewModel.showNumber ? 0.8 : 0)
                                        .offset(x: viewModel.showNumber ? 40 : 35, y: viewModel.showNumber ? -110 : -100)
                                        .animation(Animation.interpolatingSpring(stiffness: 25, damping: 5, initialVelocity: 20).delay(0.3))
                                )
                                .overlay(
                                    Text("\(viewModel.card.comboEffect)")
                                        .font(.title)
                                        .foregroundColor(.orange)
                                        .scaleEffect(viewModel.combo ? 1 : 0.2)
                                        .opacity(viewModel.combo ? 1 : 0)
                                        .offset(x: viewModel.combo ? 40 : 0, y: viewModel.combo ? -100 : 0)
                                        .animation(Animation.interpolatingSpring(stiffness: 25, damping: 5, initialVelocity: 10).delay(0.3))
                                )
                        }
                        .background(Color.black.opacity(0.000001))
                        .onTapGesture {
                            if viewModel.hit && viewModel.comboInterval{
                                viewModel.combo = true
                                viewModel.trimAmount -= CGFloat( Double(viewModel.card.comboEffect) / Double(viewModel.monster.life))
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                                    withAnimation(.default){
                                        viewModel.combo = false
                                    }
                                }

                            }else{
                                viewModel.comboInterval = false
                                
                                viewModel.wrongCombo = true
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                                    withAnimation(.default){
                                        viewModel.wrongCombo = false
                                    }
                                }
                            }
                        }
                    }
                    
                    Spacer()
                }
                .blur(radius: viewModel.tapped ? 3 : 0)
                if viewModel.tapped{
                    SingleCardView(viewModel: viewModel)
                        .transition(.scale)
                }
            
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
        .background(
            Image("bg2")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
        )
        .onAppear{
            viewModel.combatStarted = true
            slide = true
        }
    }
}

struct HeroSheetView_Previews: PreviewProvider {
    static var previews: some View {
        HeroSheetView().environmentObject(BattleScreenViewModel())
    }
}
