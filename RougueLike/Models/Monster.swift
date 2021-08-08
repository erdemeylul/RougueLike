//
//  Card.swift
//  RougueLike
//
//  Created by Erdem Senol on 23.07.2021.
//

import Foundation

struct Monster: Identifiable, Codable{
    var id = UUID().uuidString
    let name: String
    let type: String
    let rarity: String
    let numberOfEnhancements: Int
    let enhancementRarities:[String]
    let enhancementTooltips: [String]
    let tooltip: String
    let attack: Int
    var life: Int
    let image: String
    let constantLife: Int
}

var monsters: [Monster] = [
    
    
    Monster(name: "revenge", type: "dd", rarity: "common", numberOfEnhancements: 1, enhancementRarities: ["common"], enhancementTooltips: ["strikes harder"], tooltip: "hits harder based on your missing life", attack: Int.random(in: 22...55), life: 200, image: "monster2", constantLife: 200),
    
    Monster(name: "revenge", type: "dd", rarity: "common", numberOfEnhancements: 1, enhancementRarities: ["common"], enhancementTooltips: ["strikes harder"], tooltip: "hits harder based on your missing life", attack: Int.random(in: 1...66), life: 400, image: "monster", constantLife: 400),
    
    Monster(name: "revenge", type: "dd", rarity: "common", numberOfEnhancements: 1, enhancementRarities: ["common"], enhancementTooltips: ["strikes harder"], tooltip: "hits harder based on your missing life", attack: Int.random(in: 28...77), life: 300, image: "monster3", constantLife: 300),
    
    Monster(name: "revenge", type: "dd", rarity: "common", numberOfEnhancements: 1, enhancementRarities: ["common"], enhancementTooltips: ["strikes harder"], tooltip: "hits harder based on your missing life", attack: Int.random(in: 13...55), life: 350, image: "monster4", constantLife: 350),
    
    Monster(name: "revenge", type: "dd", rarity: "common", numberOfEnhancements: 1, enhancementRarities: ["common"], enhancementTooltips: ["strikes harder"], tooltip: "hits harder based on your missing life", attack: Int.random(in: 33...44), life: 440, image: "monster5", constantLife: 440),

]
