//
//  DraggableCard.swift
//  Animations
//
//  Created by Kevin Boulala on 12/02/2025.
//

import SwiftUI

struct DraggableCard: View {
    
    @State var text = "Card"
    @State private var position: CGPoint = .zero
    @State private var isDragging = false
    
    private let colors: [Color] = [.red, .blue, .purple, .pink, .orange, .clear]
    private var randomColor: Color {
        colors.randomElement() ?? .clear
    }
    
    var body: some View {
        ZStack() {
            LinearGradient(colors: [randomColor, randomColor], startPoint: .topLeading, endPoint: .bottomTrailing)
                .clipShape(.rect(cornerRadius: 10))
            RoundedRectangle(cornerRadius: 10)
                .fill(.white.opacity(0.1))
            Text(text)
                .font(.title2)
        }
        .frame(width: 161, height: 100)
        .offset(CGSize(width: isDragging ? position.x * 0.3 : 0,
                       height: isDragging ? position.y * 0.3 : 0))
        .animation(.spring(response: 0.1, dampingFraction: 0.05, blendDuration: 0), value: isDragging)
        .gesture(DragGesture(minimumDistance: 0)
            .onChanged{ value in
                position = value.location
                isDragging = true
            }
            .onEnded{ _ in
                isDragging = false
            })
    }
}

#Preview {
    DraggableCard()
}
