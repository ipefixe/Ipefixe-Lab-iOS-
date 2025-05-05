//
//  StarRating.swift
//  Animations
//
//  Created by Kevin Boulala on 24/02/2025.
//

import SwiftUI

struct StarRating: View {
    
    @Binding var rating: Int
    
    var body: some View {
        HStack(spacing: 20) {
            Spacer()
            ForEach(1..<6) { value in
                Button {
                    rating = value
                } label: {
                    Image(systemName: value <= rating ? "star.fill" : "star")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 40, height: 40)
                        .foregroundStyle(value <= rating ? .yellow : .gray)
                        .animation(.bouncy, value: rating)
                }
            }
            Spacer()
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    @Previewable @State var rating = 3
    StarRating(rating: $rating)
}
