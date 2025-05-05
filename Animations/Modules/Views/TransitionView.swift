//
//  TransitionView.swift
//  Animations
//
//  Created by Kevin Boulala on 12/02/2025.
//

import SwiftUI

struct TransitionView: View {
    
    @State private var isShowingRectangle = false
    
    var body: some View {
        VStack {
            TitleAppearance(title: "Transitions")
                .padding()
            
            Button(isShowingRectangle ? "Hide" : "Show") {
                withAnimation {
                    isShowingRectangle.toggle()
                }
            }
            .padding()
            
            Spacer()
            
            if isShowingRectangle {
                DraggableCard(text: "Opacity")
                    .transition(.opacity)
                DraggableCard(text: "Scale")
                    .transition(.scale)
                DraggableCard(text: "Slide")
                    .transition(.slide)
                DraggableCard(text: "BlurReplace")
                    .transition(.blurReplace)
                DraggableCard(text: "Scale -> Opacity")
                    .transition(.asymmetric(insertion: .scale, removal: .opacity))
            }
            
            Spacer()
        }
    }
}

#Preview {
    TransitionView()
}
