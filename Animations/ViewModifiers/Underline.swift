//
//  Underline.swift
//  ViewsAndModifiers
//
//  Created by Kevin Boulala on 04/02/2025.
//

import SwiftUI

struct Underline: ViewModifier {
    func body(content: Content) -> some View {
        VStack(alignment: .leading, spacing: 0) {
            content
            Rectangle() // I don't use Divider because of the foregroundColor
                .frame(height: 1.5)
                .foregroundColor(.teal)
        }
        .padding()
    }
}

extension View {
    func addUnderline() -> some View {
        modifier(Underline())
    }
}

#Preview {
    VStack {
        Text("Text")
            .addUnderline()
        Button("Button") {}
            .addUnderline()
    }
}
