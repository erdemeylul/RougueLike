//
//  Award.swift
//  Wheel
//
//  Created by Erdem Senol on 6.08.2021.
//

import Foundation

struct Award: Identifiable{
    var id = UUID().uuidString
    let name: String
    let image: String
}

let awards: [Award] = [
    Award(name: "first", image: "relic1"),
    Award(name: "second", image: "relic2"),
    Award(name: "third", image: "relic3"),
    Award(name: "fourth", image: "relic4"),
    Award(name: "fifth", image: "pushup"),
    Award(name: "sixth", image: "qmark"),
    Award(name: "seventh", image: "exclamation"),
    Award(name: "eight", image: "hero")
]
