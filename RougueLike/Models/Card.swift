//
//  Card.swift
//  RougueLike
//
//  Created by Erdem Senol on 23.07.2021.
//

import Foundation

struct Card: Identifiable, Codable, Equatable, Hashable{
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
    let background: String
    let index: Int
}

var cards: [Card] = [
    Card(name: "revenge", type: "dd", rarity: "common", numberOfEnhancements: 1, enhancementRarities: ["common"], enhancementTooltips: ["strikes harder"], tooltip: "hits harder based on your missing life", attack: Int.random(in: 22...45), cost: 1, image: "relic1", comboEffect: Int.random(in: 15...38), background: "back1", index: 0),
    Card(name: "bleed", type: "bleed", rarity: "common", numberOfEnhancements: 1, enhancementRarities: ["common"], enhancementTooltips: ["bleeds harder"], tooltip: "bleeds opponent for 3 turns", attack: Int.random(in: 1...77), cost: 1, image: "relic2", comboEffect: Int.random(in: 1...77), background: "back2", index: 1),
    Card(name: "revenge2", type: "dd", rarity: "common", numberOfEnhancements: 1, enhancementRarities: ["common"], enhancementTooltips: ["strikes harder"], tooltip: "hits harder based on your missing life", attack: Int.random(in: 33...35), cost: 1, image: "relic3", comboEffect: Int.random(in: 33...35), background: "back3", index: 2),
    Card(name: "bleed2", type: "bleed", rarity: "common", numberOfEnhancements: 1, enhancementRarities: ["common"], enhancementTooltips: ["bleeds harder"], tooltip: "bleeds opponent for 3 turns", attack: Int.random(in: 16...48), cost: 1, image: "relic4", comboEffect: Int.random(in: 16...48), background: "back4", index: 3),
    Card(name: "erdem", type: "dd", rarity: "common", numberOfEnhancements: 1, enhancementRarities: ["common"], enhancementTooltips: ["strikes harder"], tooltip: "hits harder based on your missing life", attack: Int.random(in: 22...55), cost: 1, image: "relic1", comboEffect: Int.random(in: 22...55), background: "back1", index: 4),
    Card(name: "tugba", type: "bleed", rarity: "common", numberOfEnhancements: 1, enhancementRarities: ["common"], enhancementTooltips: ["bleeds harder"], tooltip: "bleeds opponent for 3 turns", attack: Int.random(in: 1...77), cost: 1, image: "relic2", comboEffect: Int.random(in: 1...77), background: "back2", index: 5),
    Card(name: "eylul", type: "dd", rarity: "common", numberOfEnhancements: 1, enhancementRarities: ["common"], enhancementTooltips: ["strikes harder"], tooltip: "hits harder based on your missing life", attack:  Int.random(in: 33...35), cost: 1, image: "relic3", comboEffect:  Int.random(in: 33...35), background: "back3", index: 6),
    Card(name: "siena", type: "bleed", rarity: "common", numberOfEnhancements: 1, enhancementRarities: ["common"], enhancementTooltips: ["bleeds harder"], tooltip: "bleeds opponent for 3 turns", attack: Int.random(in: 22...55), cost: 1, image: "relic4", comboEffect: Int.random(in: 22...55), background: "back4", index: 7),
    Card(name: "nefise", type: "dd", rarity: "common", numberOfEnhancements: 1, enhancementRarities: ["common"], enhancementTooltips: ["strikes harder"], tooltip: "hits harder based on your missing life", attack: Int.random(in: 22...45), cost: 1, image: "relic1", comboEffect: Int.random(in: 22...45), background: "back1", index: 4),
    Card(name: "mehmet", type: "bleed", rarity: "common", numberOfEnhancements: 1, enhancementRarities: ["common"], enhancementTooltips: ["bleeds harder"], tooltip: "bleeds opponent for 3 turns", attack: Int.random(in: 1...77), cost: 1, image: "relic2", comboEffect: Int.random(in: 1...77), background: "back2", index: 5),
    Card(name: "suayip", type: "dd", rarity: "common", numberOfEnhancements: 1, enhancementRarities: ["common"], enhancementTooltips: ["strikes harder"], tooltip: "hits harder based on your missing life", attack: Int.random(in: 33...35), cost: 1, image: "relic3", comboEffect: Int.random(in: 33...35), background: "back3", index: 6),
    Card(name: "fatos", type: "bleed", rarity: "common", numberOfEnhancements: 1, enhancementRarities: ["common"], enhancementTooltips: ["bleeds harder"], tooltip: "bleeds opponent for 3 turns", attack: Int.random(in: 22...45), cost: 1, image: "relic4", comboEffect: Int.random(in: 22...45), background: "back4", index: 7),
    
]

var examplecard: Card = Card(name: "erdem", type: "bleed", rarity: "common", numberOfEnhancements: 1, enhancementRarities: ["common"], enhancementTooltips: ["bleeds harder"], tooltip: "bleeds opponent for 3 turns", attack: 333, cost: 1, image: "relic4", comboEffect: 0, background: "back4", index: 222)
