//
//  ShowUserView.swift
//  Animations
//
//  Created by Kevin Boulala on 12/02/2025.
//

import SwiftUI
import Observation

@Observable
class User {
    var firstName = "Ginko"
    var lastName = "Biloba"
}

struct ShowUserView: View {
    
    @State private var user = User()
    @State private var showingSheet = false
    
    
    var body: some View {
        VStack {
            TitleAppearance(title: "Show Sheet")
                .padding()
            
            Spacer()
            
            Text("Your name is \(user.firstName) \(user.lastName).")
            
            TextField("First name", text: $user.firstName)
            TextField("Last name", text: $user.lastName)
            
            Button("Show Sheet") {
                showingSheet.toggle()
            }
            .sheet(isPresented: $showingSheet) {
                SecondView(name: user.firstName)
            }
            
            Spacer()
        }
        .padding()
    }
}

struct SecondView: View {
    
    @Environment(\.dismiss) var dismiss
    
    let name: String
        
    var body: some View {
        Text("Hello, \(name)")
        Button("Dismiss") {
            dismiss()
        }
    }
}

#Preview {
    ShowUserView()
}
