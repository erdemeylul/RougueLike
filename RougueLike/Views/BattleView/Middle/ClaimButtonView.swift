//
//  ClaimButtonView.swift
//  RougueLike
//
//  Created by Erdem Senol on 1.08.2021.
//

import SwiftUI

struct ClaimButtonView: View {
    @ObservedObject var viewModel: BattleScreenViewModel
    
    var body: some View {
        ZStack {
            Button(action: {
                viewModel.bringRewards = true
            }, label: {
                Text("CLAIM")
                    .fontWeight(.heavy)
                    .padding()
                    .foregroundColor(.black)
                    .background(RoundedRectangle(cornerRadius: 12).fill(Color.white))
            }).opacity(viewModel.monsterDead && !viewModel.rewardClaimed && !viewModel.bringRewards ? 1 : 0)
            
            Button(action: {
                let randomInt = Int.random(in: 16..<50)
                viewModel.rand = randomInt
                viewModel.angle = viewModel.angle * Double(viewModel.rand)
                
                viewModel.turnWheel = true
                
                viewModel.turnButton = false
                
                if viewModel.rand % 8 == 0 {
                    withAnimation {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
                            viewModel.selectedAward = awards[0]
                        }
                    }
                   
                }else if viewModel.rand % 8 == 1 {
                    withAnimation {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
                            viewModel.selectedAward = awards[1]
                        }
                    }
                }else if viewModel.rand % 8 == 2 {
                    withAnimation {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
                            viewModel.selectedAward = awards[2]
                        }
                    }
                }else if viewModel.rand % 8 == 3 {
                    withAnimation {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
                            viewModel.selectedAward = awards[3]
                        }
                    }
                }else if viewModel.rand % 8 == 4 {
                    withAnimation {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
                            viewModel.selectedAward = awards[4]
                        }
                    }
                }else if viewModel.rand % 8 == 5 {
                    withAnimation {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
                            viewModel.selectedAward = awards[5]
                        }
                    }
                }else if viewModel.rand % 8 == 6 {
                    withAnimation {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
                            viewModel.selectedAward = awards[6]
                        }
                    }
                }else if viewModel.rand % 8 == 7 {
                    withAnimation {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
                            viewModel.selectedAward = awards[7]
                        }
                    }
                }
                
            }, label: {
                Text("TURN")
                    .fontWeight(.heavy)
                    .padding()
                    .foregroundColor(.black)
                    .background(RoundedRectangle(cornerRadius: 12).fill(Color.white))
            }).opacity(viewModel.monsterDead && viewModel.bringRewards && viewModel.turnButton ? 1 : 0)
            
            Button(action: {
                viewModel.bringRewards = false
                viewModel.rewardClaimed = true

                viewModel.angle = 45
                viewModel.rand = 0
                

                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    viewModel.selectedAward = nil
                    viewModel.turnWheel = false
                    viewModel.itemSelected = false
                    viewModel.rewardClaimed = false
                    viewModel.bringRewards = false
                    viewModel.turnButton = true
                }
                
                viewModel.mana = 3
                
                viewModel.trimAmount = 1.0
                viewModel.remainingCards = cards
                viewModel.usedCards = []
                viewModel.turnCards = []
                
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
                
            }, label: {
                Text("NEXT")
                    .fontWeight(.heavy)
                    .padding()
                    .foregroundColor(.black)
                    .background(RoundedRectangle(cornerRadius: 12).fill(Color.white))
            }).opacity(viewModel.monsterDead && viewModel.turnWheel && viewModel.selectedAward != nil ? 1 : 0)
        }
    }
}

struct ClaimButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ClaimButtonView(viewModel: BattleScreenViewModel())
    }
}
