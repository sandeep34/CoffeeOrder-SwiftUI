//
//  AddCoffeeOrderViewModel.swift
//  CoffeeOrderingApp
//
//  Created by Sandeep.Tomar on 11/2/23.
//

import Foundation

class AddCoffeeOrderViewModel: ObservableObject {
    
    var name: String = ""
    @Published var size: String = "Medium"
    @Published var coffeeName: String = ""
    
    private var webservice: WebService
    
    init() {
        self.webservice = WebService()
    }
    
    var coffeeList: [CoffeeViewModel] {
        return Coffee.all().map(CoffeeViewModel.init)
    }
    
    var total: Double {
        return calculateTotaoPrice()
    }
    
    func addOrder() {
        
        let order = Order(name: self.name, coffeeName: self.coffeeName, total: total, size: self.size)
        
        webservice.createNewOrder(order: order) { response in
            
        }
    }
    
    private func calculateTotaoPrice() -> Double {
        
        let coffeeVM = coffeeList.first{$0.name == coffeeName}
        if let coffeeVM = coffeeVM {
            return coffeeVM.coffeePrice * priceForSize()
        } else {
            return 0.0
        }
    }
    
    private func priceForSize() -> Double {
        let prices = ["Small": 2.0, "Medium": 4.0, "Large": 8.0]
        return prices[self.size]!
    }
}
