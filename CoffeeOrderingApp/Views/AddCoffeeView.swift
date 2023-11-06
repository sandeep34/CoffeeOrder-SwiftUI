//
//  AddCoffeeView.swift
//  CoffeeOrderingApp
//
//  Created by Sandeep.Tomar on 11/2/23.
//

import SwiftUI

struct AddCoffeeView: View {
    
    @Binding var isPresented: Bool
    @ObservedObject private var addCoffeeOrderVM = AddCoffeeOrderViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("INFORMATION").font(.body)) {
                        TextField("Enter Name", text: $addCoffeeOrderVM.name)
                    }
                    
                    Section(header: Text("Select Coffee").font(.body)) {
                       
                        ForEach(addCoffeeOrderVM.coffeeList, id: \.name) { coffee in
                            CoffeeSubView(coffee: coffee, selection: self.$addCoffeeOrderVM.coffeeName)
                        }
                    }
                    
                    Section(header: Text("Select Coffee").font(.body), footer: OrderTotalView(total: self.addCoffeeOrderVM.total)) {
                        Picker("", selection: $addCoffeeOrderVM.size) {
                            Text("Small").tag("Small")
                            Text("Medium").tag("Medium")
                            Text("Large").tag("Large")
                        }.pickerStyle(.segmented)
                    }
                }
            }
            .navigationTitle("Add Order")
        }
        
        HStack {
            Button("Place Order") {
                self.addCoffeeOrderVM.addOrder()
                self.isPresented = false
            }
        }
    }
}

#Preview {
    AddCoffeeView(isPresented: .constant(false))
}

struct CoffeeSubView: View {
    
    let coffee: CoffeeViewModel
    @Binding var selection: String
    
    var body: some View {
        HStack {
            Image(coffee.imageURL)
                .resizable()
                .frame(width: 105,height: 105)
            Text(coffee.name)
                .font(.title)
                .padding([.leading],20)
            Image(systemName: self.selection == self.coffee.name ? "checkmark" : "").padding()
        }.onTapGesture {
            self.selection = self.coffee.name
        }
    }
}
