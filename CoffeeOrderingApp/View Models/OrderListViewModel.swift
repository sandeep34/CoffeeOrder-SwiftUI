//
//  OrderListViewModel.swift
//  CoffeeOrderingApp
//
//  Created by Sandeep.Tomar on 11/1/23.
//

import Foundation

class OrderListViewModel: ObservableObject {
    
   @Published var orders = [OrderViewModel]()
    
    init() {
        self.getAllOrders()
    }
    
    func getAllOrders() {
        
        WebService().getAllOrder { orders in
            if let orders = orders {
                self.orders = orders.map(OrderViewModel.init)
            }
        }
    }
}

class OrderViewModel {
    
    let id = UUID()
    
    var order: Order
    
    init(order: Order) {
        self.order = order
    }
    
    var name: String {
       return order.name
    }
    
    var size: String {
        return order.size
    }
    
    var coffeeName: String {
        return order.coffeeName
    }
    
    var total: Double {
        return order.total
    }
}
