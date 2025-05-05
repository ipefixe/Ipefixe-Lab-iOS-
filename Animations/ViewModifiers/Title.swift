//
//  Title.swift
//  ViewsAndModifiers
//
//  Created by Kevin Boulala on 04/02/2025.
//

import SwiftUI

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding()
            .background(.blue)
            .clipShape(.rect(cornerRadius: 10))
    }
}

extension View {
    func titleStyle() -> some View {
        modifier(Title())
    }
}

#Preview {
    Text("Hello, world!")
        .titleStyle()
}
