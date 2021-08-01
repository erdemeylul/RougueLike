//
//  BattleScreenViewModel.swift
//  RougueLike
//
//  Created by Erdem Senol on 31.07.2021.
//

import Foundation
import SwiftUI

class BattleScreenViewModel: ObservableObject{
    //exact moment hit occurs
    @Published var hit: Bool = false
    
    //enemyHP
    @Published var trimAmount: CGFloat = 1.0
    
    //not decided
    @Published var comboEffect = false
    
    //cardmodel
    @Published var card: Card = cards[0]
    
    //to see card details
    @Published var tapped = false
    
    //monster model
    @Published var monster: Monster = monsters[0]
    
    //shows enemy HP lost after hit
    @Published var showNumber = false
    
    //if combo timing is right
    @Published var combo = false
    
    //time period u can do combo
    @Published var comboInterval = false
    
    //failed combo attempt(u can't do another one)
    @Published var wrongCombo = false
    
    //when combat starts(Appear)
    @Published var combatStarted = false
    
    //when monster turn begins
    @Published var endTurn = false

    //remaining mana
    @Published var mana: Int = 3
    
    //to see if defense ended
    @Published var endDefense = false

}


