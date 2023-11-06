//
//  Coffee.swift
//  CoffeeOrderingApp
//
//  Created by Sandeep.Tomar on 11/1/23.
//

import Foundation

struct Coffee {
    var name: String
    var imageURL: String
    var price: Double
}

extension Coffee {
    
    static func all() -> [Coffee] {
        
        return [Coffee(name: "Cappucino", imageURL: "Cappuccino", price: 1.15),
                Coffee(name: "Regular", imageURL: "Regular", price: 2.15),
                Coffee(name: "Espresso", imageURL: "Expresso", price: 4.15)]
    }
}
