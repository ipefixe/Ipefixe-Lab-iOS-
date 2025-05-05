//
//  GridStack.swift
//  ViewsAndModifiers
//
//  Created by Kevin Boulala on 05/02/2025.
//

import SwiftUI

struct GridStack<Content: View>: View {
    
    let rows: Int
    let columns: Int
    @ViewBuilder let content: (Int, Int) -> Content
    
    var body: some View {
        VStack(spacing: 20) {
            ForEach(0 ..< rows, id: \.self) { row in
                HStack(spacing: 20) {
                    ForEach(0 ..< columns, id: \.self) { column in
                        content(row, column)
                    }
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    GridStack(rows: 3, columns: 3) { row, column in
        Image(systemName: "\(row * 3 + column).circle")
            .resizable()
            .scaledToFit()
    }
    .padding()
}
