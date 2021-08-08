//
//  Relic.swift
//  RougueLike
//
//  Created by Erdem Senol on 1.08.2021.
//

import Foundation

struct Item: Identifiable, Codable{
    var id = UUID().uuidString
    let name: String
    let power: String
    let rarity: String
    let image: String
    let background: String
    let type: String
}


var firstAwardSet: [Item] = [
    Item(name: "life giver", power: " Gives your hero extr +10% life", rarity: "common", image: "relic1", background: "back2", type: "relic"),
    Item(name: "attack giver", power: "Hero attack +10%", rarity: "common", image: "relic2", background: "back3", type: "relic"),
    Item(name: "life giver", power: "Hero life +10%", rarity: "common", image: "relic3", background: "back4", type: "relic"),
]



var items:[Item] = [
    Item(name: "life giver", power: " Gives your hero extr +10% life", rarity: "common", image: "relic1", background: "back2", type: "relic"),
    Item(name: "attack giver", power: "Hero attack +10%", rarity: "common", image: "relic2", background: "back3", type: "relic"),
    Item(name: "life giver", power: "Hero life +10%", rarity: "common", image: "relic3", background: "back4", type: "relic"),
    Item(name: "attack giver", power: "Hero attack +10%", rarity: "common", image: "relic4", background: "back1", type: "relic"),
]


