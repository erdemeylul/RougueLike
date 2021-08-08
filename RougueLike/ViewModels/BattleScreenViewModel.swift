//
//  BattleScreenViewModel.swift
//  RougueLike
//
//  Created by Erdem Senol on 31.07.2021.
//

import Foundation
import SwiftUI

class BattleScreenViewModel: ObservableObject{
    
    //which stage to decide
    @Published var stage = 1
    
    //exact moment hit occurs
    @Published var hit: Bool = false
    @Published var heroHit: Bool = false

    //enemyHP
    @Published var trimAmount: CGFloat = 1.0
    @Published var heroTrimAmount: CGFloat = 1.0
    
    //not decided
    @Published var comboEffect = false
    @Published var heroComboEffect = false

    //cardmodel
    @Published var card: Card = examplecard
    
    //item model
    @Published var item: Item = items[0]
    
    //to see card details
    @Published var tapped = false
    
    //to make the cards slide
    @Published var slide = false
    
    //monster model
    @Published var monster: Monster = monsters[0]
    @Published var hero: Hero = Hero(name: "erdem", type: "mage", skills: ["kiss"], relics: ["necklace"], stats: stat, attack: 3, life: 100, image: "hero", defenseCombo: [20, 2, 3, 4], constantLife: 100)

    //shows enemy HP lost after hit
    @Published var showNumber = false
    @Published var heroShowNumber = false

    //if combo timing is right
    @Published var combo = false
    @Published var heroCombo = false

    //time period u can do combo
    @Published var comboInterval = false
    @Published var heroComboInterval = false

    //failed combo attempt(u can't do another one)
    @Published var wrongCombo = false
    @Published var heroWrongCombo = false

    //when combat starts(Appear)
    @Published var combatStarted = false
    
    //when monster turn begins
    @Published var endTurn = false

    //remaining mana
    @Published var mana: Int = 3
    
    //to show button in slight delay
    @Published var buttonShow = false

    //to see if defense ended
    @Published var endDefense = false
    
    //card tap effect
    @Published var cardAnimation = false

    
    //to see if the monster is dead
    var monsterDead: Bool{
        monster.life <= 0
    }
    
    //to see if the hero is dead
    var heroDead: Bool{
        hero.life <= 0 || remainingCards == []
    }
    
    //brings reward view after fight
    @Published var bringRewards = false
    
    //changes 'claim' button to 'next'
    @Published var rewardClaimed = false

    //award screen item selected or not
    @Published var itemSelected = false
    
    //wheel animation start
    @Published var turnWheel = false
    
    //wheel turn angle
    @Published var angle: Double = 45
    
    //random number to turn the wheel
    @Published var rand: Int = 0
    
    //award chosen by wheel
    @Published var selectedAward: Award?
    
    //to make turn button disappear
    @Published var turnButton = true

    //not to use same card again
    @Published var usedCards:[Card] = [examplecard]
    
    //to see unused cards
    @Published var remainingCards:[Card] = cards
    
    //when defend pressed add all cards to used cards
    @Published var turnCards:[Card] = []
    
    //to see if we do last stand or not
    @Published var lastStand = false
    
    
    //hero dead for game over
    @Published var deadOrAlive = false


    
}

