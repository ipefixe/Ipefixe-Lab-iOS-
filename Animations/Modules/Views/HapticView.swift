//
//  HapticView.swift
//  Animations
//
//  Created by Kevin Boulala on 18/02/2025.
//

import SwiftUI

struct HapticView: View {
    
    @State private var counter = 0
    @State private var warning = false
    @State private var error = false
    @State private var impactFl = false
    @State private var impactWe = false
    
    
    @State private var intensityFl = 0.5
    @State private var flexibilitySelection = "soft"
    private var allFlexibility = ["rigid", "soft", "solid"]
    private var flexibility: SensoryFeedback.Flexibility {
        return switch flexibilitySelection {
        case "rigid":
                .rigid
        case "soft":
                .soft
        default:
                .solid
        }
    }
    
    @State private var intensityWe = 0.5
    @State private var weightSelection = "medium"
    private var allWeight = ["light", "medium", "heavy"]
    private var weight: SensoryFeedback.Weight {
        return switch weightSelection {
        case "light":
                .light
        case "medium":
                .medium
        default:
                .heavy
        }
    }
    
    var body: some View {
        VStack(spacing: 10) {
            TitleAppearance(title: "Haptic effects")
            
            Text("Standard")
                .font(.title)
            
            HStack {
                Button("-") {
                    counter -= 1
                }
                .sensoryFeedback(.decrease, trigger: counter) { oldValue, newValue in
                    return oldValue > newValue
                }
                
                Text("\(counter)")
                    .padding()
                
                Button("+") {
                    counter += 1
                }
                .sensoryFeedback(.increase, trigger: counter) { oldValue, newValue in
                    return oldValue < newValue
                }
            }
            
            Button("Warning!") {
                warning.toggle()
            }
            .sensoryFeedback(.warning, trigger: warning)
            
            Button("Error!") {
                error.toggle()
            }
            .sensoryFeedback(.error, trigger: error)
            
            Spacer()
            
            Text("Impact with Flexibility")
                .font(.title)
            
            VStack {
                Text("Intensity \(intensityFl.formatted())")
                    .font(.caption)
                Slider(value: $intensityFl, in: 0...1, step: 0.1)
                    .padding(.horizontal, 50)
                
                Picker("Select a flexibility:", selection: $flexibilitySelection) {
                    ForEach(allFlexibility, id: \.self) {
                        Text($0)
                    }
                }
            }
            .padding()
            
            Button("Impact with flexibility") {
                impactFl.toggle()
            }
            .sensoryFeedback(.impact(flexibility: flexibility, intensity: intensityFl), trigger: impactFl)
            
            Spacer()
            
            Text("Impact with Weight")
                .font(.title)
            
            VStack {
                Text("Intensity \(intensityWe.formatted())")
                    .font(.caption)
                Slider(value: $intensityWe, in: 0...1, step: 0.1)
                    .padding(.horizontal, 50)
                
                Picker("Select a weight:", selection: $weightSelection) {
                    ForEach(allWeight, id: \.self) {
                        Text($0)
                    }
                }
            }
            .padding()
            
            Button("Impact with weight") {
                impactWe.toggle()
            }
            .sensoryFeedback(.impact(weight: weight, intensity: intensityWe), trigger: impactWe)
            
            Spacer()
        }
    }
}

#Preview {
    HapticView()
}
