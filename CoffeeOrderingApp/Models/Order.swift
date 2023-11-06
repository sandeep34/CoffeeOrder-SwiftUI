//
//  Order.swift
//  CoffeeOrderingApp
//
//  Created by Sandeep.Tomar on 11/1/23.
//

import Foundation

struct Order: Codable {
    
    var name: String
    var coffeeName: String
    var total: Double
    var size: String
}
