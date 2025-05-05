//
//  Color+.swift
//  ViewsAndModifiers
//
//  Created by Kevin Boulala on 05/02/2025.
//

import SwiftUI

extension Color {
    static var random: Color? {
        let all: [Color] = [.blue, .brown, .cyan, .gray, .green, .indigo, .mint, .orange, .pink, .purple, .red, .teal, .yellow]
        return all.randomElement()
    }
}
