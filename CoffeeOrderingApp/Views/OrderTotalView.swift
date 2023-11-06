//
//  OrderTotalView.swift
//  CoffeeOrderingApp
//
//  Created by Sandeep.Tomar on 11/5/23.
//

import SwiftUI

struct OrderTotalView: View {
    
    var total: Double
    
    var body: some View {
        HStack(alignment: .center) {
            Spacer()
            Text(String(format: "$%.2f", self.total))
                .font(.title)
            Spacer()
        }.padding(10)
            .foregroundColor(.green)
    } 
}

#Preview {
    OrderTotalView(total: 45.67)
}
