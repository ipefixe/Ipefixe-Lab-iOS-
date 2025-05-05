//
//  ContentView.swift
//  Animations
//
//  Created by Kevin Boulala on 07/02/2025.
//

import SwiftUI

struct AnimationsView: View {
        
    var body: some View {
        ZStack {
            balls
            
            VStack {
                TitleAppearance(title: "Animations")
                    .padding()
                
                Spacer()
                
                HStack {
                    Spacer()
                    DragMeButton()
                    VStack {
                        DragMeButton()
                        DragMeButton()
                    }
                    DragMeButton()
                    Spacer()
                }
                
                HStack {
                    SpotifyPlayButton()
                    SpinMeButton()
                    PulsatingButton()
                }
                
                DraggableCard(text: "Crazy🙈Card")
                
                HStack {
                    TapMeButton()
                }
                
                Spacer()
            }
        }
    }
    
    private var balls: some View {
        ZStack {
            let numberOfBalls = 50
            let ys = (0 ... numberOfBalls).map { _ in CGFloat.random(in: -300 ... 400) }.sorted()
            
            ForEach((0 ... numberOfBalls), id: \.self) { ballNumber in
                let x = CGFloat.random(in: -180 ... 180)
                let y = ys[ballNumber]
                let duration = Double.random(in: 0.3 ... 0.6)
                let amplitude = Double.random(in: 40 ... 140)
                let ballSize = Double.random(in: 10 ... 50)
                
                InfiniteBouncingBall(animationDuration: duration, animationAmplitude: amplitude, ballSize: ballSize)
                    .offset(x: x, y: y)
            }
            
            InfiniteBouncingBall(animationDuration: 1.8, animationAmplitude: 700, ballSize: 200)
                .offset(x: 0, y: 300)
        }
    }
}

#Preview {
    AnimationsView()
}
