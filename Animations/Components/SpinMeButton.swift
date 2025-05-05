//
//  SpinMeButton.swift
//  Animations
//
//  Created by Kevin Boulala on 11/02/2025.
//

import SwiftUI

struct SpinMeButton: View {
    
    @State private var animationAmount = 0.0
    @State private var foregroundColor = Color.white
    @State private var monkeyDisplayed = false
    
    var body: some View {
        ZStack {
            Capsule()
                .fill(.indigo)
                .frame(width: 140, height: 50)
                .overlay {
                    Text("Spin Me")
                        .foregroundStyle(foregroundColor)
                }
            Text("🐒")
                .font(.system(size: 40))
                .opacity(monkeyDisplayed ? 1.0 : 0.0)
        }
        .rotation3DEffect(.degrees(animationAmount), axis: (x: 0.0, y: 1.0, z: 0.0))
        .gesture(DragGesture(minimumDistance: 0)
            .onChanged { _ in
                update(isTapped: true)
            }
            .onEnded { _ in
                NSLog("🟣 Spin me gesture ended")
                
                update(isTapped: false)
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                    monkeyDisplayed.toggle()
                }
                
                withAnimation(.spring(duration: 1, bounce: 0.4)) {
                    animationAmount += 180
                }
            }
        )
    }
    
    private func update(isTapped: Bool) {
        if isTapped {
            foregroundColor = .white.opacity(0.6)
        } else {
            foregroundColor = .white.opacity(1)
        }
    }
}

#Preview {
    SpinMeButton()
}
