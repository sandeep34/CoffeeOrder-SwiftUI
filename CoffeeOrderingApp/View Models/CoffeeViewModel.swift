//
//  CoffeeViewModel.swift
//  CoffeeOrderingApp
//
//  Created by Sandeep.Tomar on 11/2/23.
//

import Foundation

class CoffeeListViewModel {
    
    var coffeeList: [CoffeeViewModel] = [CoffeeViewModel]()
}

struct CoffeeViewModel {
    
    var coffee: Coffee
    
    init(coffee: Coffee) {
        self.coffee = coffee
    }
    
    var name: String {
        return coffee.name
    }
    
    var imageURL: String {
        return coffee.imageURL
    }
    
    var coffeePrice: Double {
        return coffee.price
    }
}
