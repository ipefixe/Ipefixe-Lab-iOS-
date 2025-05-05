//
//  PushButton.swift
//  Animations
//
//  Created by Kevin Boulala on 24/02/2025.
//

import SwiftUI

struct PushButton: View {
    let title: String
    @Binding var isOn: Bool
    var onColors = [Color.red, Color.yellow]
    var offColors = [Color(white: 0.6), Color(white: 0.4)]
    
    var body: some View {
        Button(title) {
            isOn.toggle()
        }
        .padding()
        .background(LinearGradient(colors: isOn ? onColors : offColors, startPoint: .top, endPoint: .bottom))
        .foregroundStyle(.white)
        .clipShape(.capsule)
        .shadow(radius: isOn ? 0 : 5)
    }
}

#Preview {
    @Previewable @State var isOn = false
    PushButton(title: "Something", isOn: $isOn)
}
