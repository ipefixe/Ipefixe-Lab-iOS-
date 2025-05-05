//
//  EmojiRating.swift
//  Animations
//
//  Created by Kevin Boulala on 24/02/2025.
//

import SwiftUI

struct EmojiRating: View {
    
    let rating: Int
    
    var body: some View {
        switch rating {
        case 1:
            Text("💩")
        case 2:
            Text("🤢")
        case 3:
            Text("🙂")
        case 4:
            Text("😋")
        default:
            Text("♥️")
        }
    }
}

#Preview {
    VStack {
        ForEach(1...5, id: \.self) { rating in
            EmojiRating(rating: rating)
        }
    }
}
