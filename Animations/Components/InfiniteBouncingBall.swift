//
//  InfiniteBouncingBall.swift
//  Animations
//
//  Created by Kevin Boulala on 10/02/2025.
//

import SwiftUI

struct InfiniteBouncingBall: View {
    
    @State private var isDisplayed = false
    
    @State var animationDuration = 1.0
    @State var animationAmplitude = 260.0
    @State var ballSize = 80.0
    
    @State private var startBlur = 0.5
    @State private var endBlur = 10.0
    
    var body: some View {
        ZStack {
            Ellipse()
                .fill(.gray.opacity(0.3))
                .offset(y: (ballSize / 2) - 5)
                .frame(width: isDisplayed ? ballSize * 1.5 : ballSize, height: 10)
                .blur(radius: isDisplayed ? endBlur : startBlur)
                .animation(.timingCurve(.easeInOut, duration: animationDuration).repeatForever(), value: isDisplayed)
            
            Text("🏀")
                .font(.system(size: ballSize))
                .rotationEffect(.degrees(isDisplayed ? 0 : 60))
                .offset(y: isDisplayed ? -animationAmplitude : 0)
                .animation(.timingCurve(.easeInOut, duration: animationDuration).repeatForever(), value: isDisplayed)
                .onAppear {
                    isDisplayed = true
                }
        }
    }
}

#Preview {
    InfiniteBouncingBall()
}
