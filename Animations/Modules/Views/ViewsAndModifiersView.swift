//
//  ViewsAndModifiersView.swift
//  Animations
//
//  Created by Kevin Boulala on 14/02/2025.
//

import SwiftUI

struct ViewsAndModifiersView: View {
    @State var useRedText = false
    
    var body: some View {
        VStack {
            TitleAppearance(title: "Playground")
            Button("Swap my color!") {
                useRedText.toggle()
            }
            .padding()
            .foregroundStyle(useRedText ? .red : .blue)
            Text("A grid stack :")
            GridStack(rows: 3, columns: 3) { row, column in
                Button(action: {}, label: {
                    Image(systemName: "\(row * 3 + column).circle")
                        .resizable()
                        .scaledToFit()
                        .tint(.random)
                        .blur(radius: 2)
                })
                
            }
            .frame(width: 300, height: 300)
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ViewsAndModifiersView()
}
