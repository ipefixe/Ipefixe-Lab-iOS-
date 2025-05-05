//
//  CupcakeCheckoutView.swift
//  Animations
//
//  Created by Kevin Boulala on 18/02/2025.
//

import SwiftUI

struct CupcakeCheckoutView: View {
    @Bindable var order: CupcakeOrder
    
    @State private var confirmationMessage = ""
    @State private var titleMessage = ""
    @State private var showingConfirmation = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 40) {
                AsyncImage(url: URL(string: "https://hws.dev/img/cupcakes@3x.jpg")) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .scaledToFit()
                    } else if phase.error != nil {
                            // Do nothing
                    } else {
                        ProgressView()
                    }
                }
                
                Text("Your total is \(order.cost, format: .currency(code: "EUR"))")
                    .font(.title)
                
                Button("Place Order") {
                    Task {
                        await placeOrder()
                    }
                }
                
                Text("Call with the help of *reqres.in*")
                    .font(.caption)
                    .foregroundStyle(.gray)
                    .padding(.top, 100)
                
            }
        }
        .scrollBounceBehavior(.basedOnSize)
        .navigationTitle("Checkout")
        .navigationBarTitleDisplayMode(.inline)
        .alert(titleMessage, isPresented: $showingConfirmation) {
            Button("OK") {}
        } message: {
            Text(confirmationMessage)
        }

    }
    
    private func placeOrder() async {
        guard let encoded = try? JSONEncoder().encode(order) else {
            NSLog("‼️ Failed to encore cupcake order")
            showingMessage(title: "Error", message: "Failed to encore cupcake order")
            return
        }
        
        let urlString = "https://reqres.in/api/cupcakes"
        guard let url = URL(string: urlString) else {
            NSLog("‼️ Invalid URL \(urlString)")
            showingMessage(title: "Error", message: "Invalid URL")
            return
        }
        
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        
        do {
            let (data, _) = try await URLSession.shared.upload(for:request, from: encoded)
            
            let decodedOrder = try JSONDecoder().decode(CupcakeOrder.self, from: data)
            
            titleMessage = "Thank you!"
            showingMessage(title: "Thank you!", message: "Your order for \(decodedOrder.quantity)x \(CupcakeOrder.flavors[decodedOrder.flavor].lowercased()) cupcakes is on its way!")
        } catch {
            NSLog("‼️ Checkout failed: \(error.localizedDescription)")
            showingMessage(title: "Error", message: "Checkout failed: \(error.localizedDescription)")
        }
    }
    
    private func showingMessage(title: String, message: String) {
        titleMessage = title
        confirmationMessage = message
        showingConfirmation = true
    }
}

#Preview {
    CupcakeCheckoutView(order: CupcakeOrder())
}
