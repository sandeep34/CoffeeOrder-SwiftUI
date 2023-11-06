//
//  OrderListView.swift
//  CoffeeOrderingApp
//
//  Created by Sandeep.Tomar on 11/1/23.
//

import SwiftUI

struct OrderListView: View {
    
    let order: [OrderViewModel]
    
    init(order: [OrderViewModel]) {
        self.order = order
    }
    
    var body: some View {
        List {
            ForEach(self.order, id: \.id) { order in
                HStack {
                    Image(order.coffeeName)
                        .resizable()
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                    VStack {
                        Text(order.name)
                            .font(.title)
                            .padding([.leading, .top], 10)
                        
                        HStack {
                            Text(order.coffeeName)
                                .background(Color.gray)
                                .foregroundColor(Color.white)
                                .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                                .cornerRadius(20)
                                .frame(width: 100, height: 100)
                            Text(order.size)
                                .background(Color.red)
                                .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                                .cornerRadius(5)
                                .frame(width: 100, height: 100)
                        }
                       
                    }
                }
            }
        }
    }
}

#Preview {
    OrderListView(order: [OrderViewModel(order: Order(name: "Latte", coffeeName: "Regular", total: 34, size: "Medium"))])
}
