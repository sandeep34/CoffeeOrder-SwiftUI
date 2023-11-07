//
//  ContentView.swift
//  CoffeeOrderingApp
//
//  Created by Sandeep.Tomar on 11/1/23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var orderListVM = OrderListViewModel()
    
    @State private var showModel: Bool = false
    
    init() {
        
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.backgroundColor = UIColor(Color.yellow)
        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
        
    }
    
    var body: some View {
        NavigationView {
            OrderListView(order: orderListVM.orders)
                .navigationTitle("Coffee Order")
                .navigationBarItems(leading: Button(action: reloadOrders) {
                    Image(systemName: "arrow.clockwise")
                        .foregroundColor(Color.white)
                    }, trailing: Button(action: showAddCoffeeOrderView){
                        Image(systemName: "plus")
                            .foregroundColor(Color.white)
                })
            
            
                .sheet(isPresented: $showModel) {
                    AddCoffeeView(isPresented: $showModel)
                }
        }
    }
    
    private func reloadOrders() {
        self.orderListVM.getAllOrders()
    }
    
    private func showAddCoffeeOrderView() {
        self.showModel = true
    }
}

#Preview {
    ContentView()
}
