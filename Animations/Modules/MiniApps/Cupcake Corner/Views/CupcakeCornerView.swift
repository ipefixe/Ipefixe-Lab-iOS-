//
//  CupcakeCornerView.swift
//  Animations
//
//  Created by Kevin Boulala on 17/02/2025.
//

import SwiftUI

struct CupcakeCornerView: View {
    
    @Bindable private var order = CupcakeOrder()
    
    var body: some View {
//        NavigationStack {
            Form {
                Section {
                    Picker("Please select a flavor", selection: $order.flavor) {
                        ForEach(CupcakeOrder.flavors.indices, id: \.self) {
                            Text(CupcakeOrder.flavors[$0])
                        }
                    }
                    
                    Stepper("Number of cakes: \(order.quantity)", value: $order.quantity, in: 3...20)
                }
                
                Section {
                    Toggle("Any special requests?", isOn: $order.specialRequestEnabled)
                    
                    if order.specialRequestEnabled {
                        Toggle("Add extra frosting", isOn: $order.extraFrosting)
                        
                        Toggle("Add extra sprinkles", isOn: $order.addSprinkles)
                    }
                }
                
                Section {
                    NavigationLink("Delivery details") {
                        CupcakeAddressView(order: order)
                    }
                }
            }
            .navigationTitle("Cupcake Corner")
            .navigationBarTitleDisplayMode(.large)
//        }
    }
}

#Preview {
    CupcakeCornerView()
}
