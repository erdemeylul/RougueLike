//
//  HeroSheetView.swift
//  RougueLike
//
//  Created by Erdem Senol on 23.07.2021.
//

import SwiftUI

struct HeroSheetView: View {
    @EnvironmentObject var viewModel: BattleScreenViewModel
    @State var isHeroPresented = false
    @State var isMonsterPresented = false

    var body: some View {
        ZStack {
                VStack{
                    ZStack {
                        
                        VStack{
                            EnemyView(viewModel: viewModel)
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
                                    CardAttackTextView(viewModel: viewModel)
                                )
                                .overlay(
                                    ComboAttackTextView(viewModel: viewModel)
                                )
                        }
                        .background(Color.black.opacity(0.000001))
                        .onTapGesture {
                            if viewModel.hit && viewModel.comboInterval{
                                viewModel.combo = true
                                
                                withAnimation(.easeInOut(duration: 1)){
                                    viewModel.trimAmount -= CGFloat( Double(viewModel.card.comboEffect) / Double(viewModel.monster.constantLife))
                                }
                                
                                
                                viewModel.monster.life -= viewModel.card.comboEffect
                                
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
                    }.onLongPressGesture {
                        isMonsterPresented = true
                    }
                        if viewModel.monsterDead && !viewModel.rewardClaimed{
                            AwardView(viewModel: viewModel)
                                .offset(x: viewModel.bringRewards ? 0 : -500)
                                .animation(Animation.interpolatingSpring(stiffness: 40, damping: 5).delay(0.3))
                        }
                    }.sheet(isPresented: $isMonsterPresented
                            ,content: {
                        Text("hehe")
                    })

                   
                    
                    ZStack{
                        VStack {
                            HeroView(viewModel: viewModel)
                                .overlay(
                                    Image("exclamation")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 50, height: 80)
                                        .opacity(viewModel.heroWrongCombo ? 1 : 0)
                                        .padding()
                                    ,alignment: .top
                                )

                                .overlay(
                                    Image("slash")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 200, height: 100)
                                        .opacity(viewModel.heroHit ? 1 : 0)
                                )
                                .overlay(
                                    CardDefenseTextView(viewModel: viewModel)
                                )
                                .overlay(
                                    ComboDefenseTextView(viewModel: viewModel)
                                )
                        }
                        .background(Color.black.opacity(0.000001))
                        .onTapGesture {
                            if viewModel.lastStand{
                                if viewModel.heroHit && viewModel.heroComboInterval{
                                    viewModel.remainingCards = cards
                                    viewModel.usedCards = []
                                }else{
                                    viewModel.remainingCards = []
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                        viewModel.deadOrAlive = true
                                    }
                                }
                            }else{
                                if viewModel.heroHit && viewModel.heroComboInterval{
                                    viewModel.heroCombo = true
                                    withAnimation(.easeInOut(duration: 1)){
                                        viewModel.heroTrimAmount += CGFloat( Double(viewModel.hero.defenseCombo[0]) / Double(viewModel.hero.constantLife))
                                    }
                                    
                                    
                                    if viewModel.hero.life + viewModel.hero.defenseCombo[0] <= viewModel.hero.constantLife{
                                        viewModel.hero.life += viewModel.hero.defenseCombo[0]
                                    }else{
                                        viewModel.hero.life +=
                                        ((viewModel.hero.life + viewModel.hero.defenseCombo[0]) - viewModel.hero.constantLife)
                                    }
                                    
                                    
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                                        withAnimation(.default){
                                            viewModel.heroCombo = false
                                        }
                                    }
                                }else{
                                    
                                    viewModel.heroWrongCombo = true
                                    viewModel.heroComboInterval = false
                                    
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                                        withAnimation(.default){
                                            viewModel.heroWrongCombo = false
                                        }
                                    }
                                }
                            }
                          
                        }
                        .onLongPressGesture {
                            isHeroPresented = true
                        }
                        .sheet(isPresented: $isHeroPresented, content: {
                            CollectiblesView()
                        })
                        if viewModel.mana > 0 && !viewModel.monsterDead{
                            MainCardView(viewModel: viewModel)
                                .offset(x: viewModel.slide ? 0 : 500)
                                .animation(Animation.interpolatingSpring(stiffness: 40, damping: 5).delay(0.3))
                        }
                    }
                }
                .blur(radius: viewModel.tapped || viewModel.itemSelected ? 3 : 0)
            
            
                

                if viewModel.tapped{
                    SingleCardView(viewModel: viewModel)
                        .scaleEffect(viewModel.tapped ? 1 : 0)
                }
            
               
            
            HStack{
                EndDefenseButtonView(viewModel: viewModel)
                Spacer()
                ClaimButtonView(viewModel: viewModel)
                Spacer()
                EndTurnButtonView(viewModel: viewModel)
                
            }.sheet(isPresented: $viewModel.deadOrAlive, content: {
                GameOverView()
            })
            
            if viewModel.itemSelected{
                SingleItemView(viewModel: viewModel)
            }
        }
        .background(
            Image("bg2")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
        )
        .onAppear{
            viewModel.combatStarted = true
            viewModel.slide = true
            if viewModel.stage == 1{
                let firstMonsters = Int.random(in: 0...4)
                viewModel.monster = monsters[firstMonsters]
            }else if viewModel.stage == 2{
                let secondMonsters = Int.random(in: 5...9)
                viewModel.monster = monsters[secondMonsters]
            }else if viewModel.stage == 3{
                let thirdMonsters = Int.random(in: 10...14)
                viewModel.monster = monsters[thirdMonsters]
            }
        }
        .onTapGesture {
            viewModel.itemSelected = false
            viewModel.rewardClaimed = true
        }
    }
}

struct HeroSheetView_Previews: PreviewProvider {
    static var previews: some View {
        HeroSheetView().environmentObject(BattleScreenViewModel())
    }
}
