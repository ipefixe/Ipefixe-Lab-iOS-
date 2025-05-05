//
//  TextFieldTextEditorView.swift
//  Animations
//
//  Created by Kevin Boulala on 24/02/2025.
//

import SwiftUI

struct TextFieldTextEditorView: View {
    @AppStorage("notes") private var notes = ""
    
    var body: some View {
        VStack {
            TitleAppearance(title: "TextEditor vs TextField")
            Text("TextEditor")
            TextEditor(text: $notes)
                .padding()
            
            Rectangle()
                .fill(LinearGradient(colors: [.blue.opacity(0.2), .cyan.opacity(0.8), .blue.opacity(0.2)],
                                     startPoint: .topLeading,
                                     endPoint: .bottomTrailing))
                .frame(maxWidth: .infinity, maxHeight: 4)
                .blur(radius: 2)
            
            Text("TextField")
            TextField("Enter your text", text: $notes, axis: .vertical)
                .textFieldStyle(.roundedBorder)
                .padding()
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    TextFieldTextEditorView()
}
