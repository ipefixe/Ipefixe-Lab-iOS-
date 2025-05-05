//
//  CupcakeAddressView.swift
//  Animations
//
//  Created by Kevin Boulala on 18/02/2025.
//

import SwiftUI

struct CupcakeAddressView: View {
    @Bindable var order: CupcakeOrder
    @State var displayWarning = false
    
    var body: some View {
        Form {
            Section {
                TextField("Name", text: $order.name)
                TextField("Street Address", text: $order.streetAddress)
                TextField("City", text: $order.city)
                TextField("Zip", text: $order.zip)
            }
            
            Section {
                NavigationLink("Check out") {
                    CupcakeCheckoutView(order: order)
                }
            }
            .disabled(order.hasValidAddress == false)
        }
        .navigationTitle("Delivery details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    CupcakeAddressView(order: CupcakeOrder())
}
