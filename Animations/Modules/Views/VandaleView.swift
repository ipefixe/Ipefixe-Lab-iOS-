//
//  VandaleView.swift
//  Animations
//
//  Created by Kevin Boulala on 28/02/2025.
//

import AVFoundation
import SwiftUI

struct VandaleView: View {
    
    @State private var startTransition = false
    @State private var isDisplayed = false
    @State private var duration: TimeInterval = 1.33
    
    @State private var player: AVAudioPlayer?
    
    var body: some View {
        VStack {
            if startTransition {
                Image(.vandale)
                    .resizable()
                    .scaledToFit()
                    .padding()
                    .transition(.scale)
                    .rotationEffect(.degrees(isDisplayed ? 720 : 00))
                    .animation(.timingCurve(.easeInOut, duration: duration), value: isDisplayed)
                    .onAppear {
                        isDisplayed = true
                    }
            }
        }
        .onAppear {
            playSound()
            withAnimation(.timingCurve(.easeInOut, duration: duration)) {
                startTransition.toggle()
            }
        }
    }
    
    private func playSound() {
        let soundName = "BatmanTransition"
        guard let url = Bundle.main.url(forResource: soundName, withExtension: "mp3") else {
            NSLog("Error sound not found: \(soundName).mp3")
            return
        }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.volume = 0.5
            if player?.play() != true {
                NSLog("Error while playing sound")
            }
        } catch {
            NSLog("Error playing sound: \(error.localizedDescription)")
        }
    }
}

#Preview {
    VandaleView()
}
