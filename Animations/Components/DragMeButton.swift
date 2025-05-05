//
//  DragMeButton.swift
//  Animations
//
//  Created by Kevin Boulala on 10/02/2025.
//

import SwiftUI

struct DragMeButton: View {
    
    @State private var isShaking = false
    @State private var touchLocation: CGPoint = .zero
    @State private var zIndex = 0.0
    
    var body: some View {
        Circle()
            .fill(Color.blue)
            .frame(width: 80)
            .overlay(alignment: .center) {
                Text("Drag Me")
                    .foregroundColor(.white)
            }
            .offset(x: isShaking ? touchLocation.x * 0.4 : 0, y: isShaking ? touchLocation.y * 0.4 : 0)
            .animation(.spring(response: 0.3, dampingFraction: 0.2, blendDuration: 0.3), value: isShaking)
            .gesture(
                DragGesture(minimumDistance: 0)
                    .onChanged { value in
                        touchLocation = value.location
                        isShaking = true
                        zIndex = 1.0
                    }
                    .onEnded { _ in
                        NSLog("🔵 Drag gesture ended")
                        isShaking = false
                        zIndex = 0
                    }
            )
            .zIndex(zIndex)
    }
}

#Preview {
    DragMeButton()
}
