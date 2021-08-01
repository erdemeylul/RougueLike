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
    let life: Int
    let image: String
}

var monsters: [Monster] = [
    Monster(name: "revenge", type: "dd", rarity: "common", numberOfEnhancements: 1, enhancementRarities: ["common"], enhancementTooltips: ["strikes harder"], tooltip: "hits harder based on your missing life", attack: 4, life: 400, image: "1"),

]
