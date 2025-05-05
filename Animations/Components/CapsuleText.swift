//
//  CapsuleText.swift
//  ViewsAndModifiers
//
//  Created by Kevin Boulala on 04/02/2025.
//

import SwiftUI

struct CapsuleText: View {
    
    @State var text = "Capsule Text"
    
    var body: some View {
        Text(text)
            .font(.title)
            .padding()
            .foregroundStyle(.white)
            .background(.blue)
            .clipShape(.capsule)
    }
}

#Preview {
    VStack {
        CapsuleText()
        CapsuleText(text: "Sample")
    }
}
