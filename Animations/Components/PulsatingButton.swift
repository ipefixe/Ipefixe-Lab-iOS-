//
//  PulsatingButton.swift
//  Animations
//
//  Created by Kevin Boulala on 11/02/2025.
//

import SwiftUI

struct PulsatingButton: View {
    
    @State private var pulsatingValue = 1.0
    @State private var tapAnimation = 1.0
    @State private var colorButton = Color.red
    
    var body: some View {
        ZStack {
            Circle()
                .fill(.yellow)
                .frame(width: 80)
                .blur(radius: 2)
                .scaleEffect(pulsatingValue)
                .animation(pulsatingAnimation, value: pulsatingValue)
                .onAppear {
                    pulsatingValue = 1.3
                }
            Circle()
                .fill(colorButton)
                .frame(width: 80)
                .overlay {
                    Image(systemName: "bolt.heart.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundStyle(.yellow)
                        .scaleEffect(pulsatingValue)
                        .animation(pulsatingAnimation, value: pulsatingValue)
                }
                .scaleEffect(tapAnimation)
                .gesture(DragGesture(minimumDistance: 0)
                    .onChanged { _ in
                        update(isTapped: true)
                    }
                    .onEnded { _ in
                        NSLog("♥️ Pulsating button gesture ended")
                        update(isTapped: false)
                        
                    })
        }
    }
    
    private var pulsatingAnimation: Animation = .easeOut(duration: 0.5).repeatForever()
    
    private func update(isTapped: Bool) {
        if isTapped {
            tapAnimation = 0.9
            colorButton = .red.opacity(0.8)
        } else {
            tapAnimation = 1.0
            colorButton = .red
        }
    }
}

#Preview {
    PulsatingButton()
}
