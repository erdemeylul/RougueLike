//
//  Card.swift
//  RougueLike
//
//  Created by Erdem Senol on 23.07.2021.
//

import Foundation

struct Card: Identifiable, Codable{
    var id = UUID().uuidString
    let name: String
    let type: String
    let rarity: String
    let numberOfEnhancements: Int
    let enhancementRarities:[String]
    let enhancementTooltips: [String]
    let tooltip: String
    let attack: Int
    let cost: Int
    let image: String
    let comboEffect: Int
}

var cards: [Card] = [
    Card(name: "revenge", type: "dd", rarity: "common", numberOfEnhancements: 1, enhancementRarities: ["common"], enhancementTooltips: ["strikes harder"], tooltip: "hits harder based on your missing life", attack: 4, cost: 1, image: "1", comboEffect: 200),
    Card(name: "bleed", type: "bleed", rarity: "common", numberOfEnhancements: 1, enhancementRarities: ["common"], enhancementTooltips: ["bleeds harder"], tooltip: "bleeds opponent for 3 turns", attack: 10, cost: 1, image: "1", comboEffect: 20),
    Card(name: "revenge2", type: "dd", rarity: "common", numberOfEnhancements: 1, enhancementRarities: ["common"], enhancementTooltips: ["strikes harder"], tooltip: "hits harder based on your missing life", attack: 60, cost: 1, image: "1", comboEffect: 30),
    Card(name: "bleed2", type: "bleed", rarity: "common", numberOfEnhancements: 1, enhancementRarities: ["common"], enhancementTooltips: ["bleeds harder"], tooltip: "bleeds opponent for 3 turns", attack: 2, cost: 1, image: "1", comboEffect: 40),
    Card(name: "revenge3", type: "dd", rarity: "common", numberOfEnhancements: 1, enhancementRarities: ["common"], enhancementTooltips: ["strikes harder"], tooltip: "hits harder based on your missing life", attack: 30, cost: 1, image: "1", comboEffect: 50),
    Card(name: "bleed3", type: "bleed", rarity: "common", numberOfEnhancements: 1, enhancementRarities: ["common"], enhancementTooltips: ["bleeds harder"], tooltip: "bleeds opponent for 3 turns", attack: 20, cost: 1, image: "1", comboEffect: 60),
    Card(name: "revenge4", type: "dd", rarity: "common", numberOfEnhancements: 1, enhancementRarities: ["common"], enhancementTooltips: ["strikes harder"], tooltip: "hits harder based on your missing life", attack: 2, cost: 1, image: "1", comboEffect: 70),
    Card(name: "bleed4", type: "bleed", rarity: "common", numberOfEnhancements: 1, enhancementRarities: ["common"], enhancementTooltips: ["bleeds harder"], tooltip: "bleeds opponent for 3 turns", attack: 50, cost: 1, image: "1", comboEffect: 80),
]
