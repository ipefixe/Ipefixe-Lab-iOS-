//
//  SpotifyPlayButton.swift
//  Animations
//
//  Created by Kevin Boulala on 10/02/2025.
//

import SwiftUI

struct SpotifyPlayButton: View {
    
    @State private var playAnimation = 1.0
    @State private var playColor = Color.green
    @State private var isPlaying = true
    
    var body: some View {
        Circle()
            .fill(playColor)
            .frame(width: 80)
            .overlay {
                Image(systemName: isPlaying ? "play.fill" : "pause.fill")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .padding(.leading, isPlaying ? 8 : 0)
            }
            .scaleEffect(playAnimation)
            .gesture(DragGesture(minimumDistance: 0)
                .onChanged { _ in
                    withAnimation(.interpolatingSpring(mass: 0.1, stiffness: 100, damping: 5)) {
                        update(isTapped: true)
                    }
                }
                .onEnded { _ in
                    NSLog("🟢 Play button on tap gesture ended")
                    isPlaying.toggle()
                    withAnimation(.interpolatingSpring(mass: 0.1, stiffness: 100, damping: 5).delay(0.15)) {
                        update(isTapped: false)
                    }
                })
    }
    
    private func update(isTapped: Bool) {
        if isTapped {
            playAnimation = 0.9
            playColor = .green.opacity(0.8)
        } else {
            playAnimation = 1.0
            playColor = .green
        }
    }
}

#Preview {
    SpotifyPlayButton()
}
