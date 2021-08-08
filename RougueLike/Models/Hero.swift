//
//  Card.swift
//  RougueLike
//
//  Created by Erdem Senol on 23.07.2021.
//

import Foundation

struct Hero: Identifiable, Codable{
    var id = UUID().uuidString
    let name: String
    let type: String
    let skills: [String]
    let relics: [String]
    let stats: [Stats]
    let attack: Int
    var life: Int
    let image: String
    let defenseCombo: [Int]
    var constantLife: Int

}

var hero: Hero =
    Hero(name: "erdem", type: "mage", skills: ["kiss"], relics: ["necklace"], stats: stat, attack: 3, life: 100, image: "hero", defenseCombo: [5, 6, 7, 8], constantLife: 100)


struct Stats: Identifiable, Codable{
    var id = UUID().uuidString
    let name: String
    let stat: Int
}

var stat = [Stats(name: "defense", stat: 10), Stats(name: "attack", stat: 3)]
