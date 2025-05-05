//
//  TapMeButton.swift
//  Animations
//
//  Created by Kevin Boulala on 10/02/2025.
//

import SwiftUI

struct TapMeButton: View {
    
    @State private var tapMeAnimation = 1.0
    
    var body: some View {
        Circle()
            .fill(.red)
            .frame(width: 80)
            .overlay {
                Text("Tap Me")
                    .foregroundStyle(.white)
            }
            .scaleEffect(tapMeAnimation)
            .blur(radius: (tapMeAnimation - 1) * 2)
            .animation(.bouncy(duration: 0.3, extraBounce: 0.3), value: tapMeAnimation)
            .gesture(TapGesture()
                .onEnded { _ in
                    NSLog("🔴 Tap Me on tap gesture ended")
                    tapMeAnimation += 0.33
                })
            .gesture(LongPressGesture()
                .onEnded { _ in
                    NSLog("🔴 Tap Me long press gesture ended")
                    tapMeAnimation = 1.0
                })
    }
}

#Preview {
    TapMeButton()
}
