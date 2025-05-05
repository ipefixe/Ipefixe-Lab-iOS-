//
//  TitleAppearance.swift
//  Animations
//
//  Created by Kevin Boulala on 10/02/2025.
//

import SwiftUI

struct TitleAppearance: View {
    
    var title: String
    
    @State private var isDisplayed = false
    
    var body: some View {
        Text(title.uppercased())
            .font(.largeTitle)
            .fontWeight(.heavy)
            .opacity(isDisplayed ? 1 : 0)
            .offset(y: isDisplayed ? 0 : -20)
            .animation(.easeIn(duration: 1.4).delay(0.3), value: isDisplayed)
            .onAppear(perform: {
                isDisplayed = true
            })
            .padding(.bottom, 20)
    }
}

#Preview {
    TitleAppearance(title: "Title")
}
