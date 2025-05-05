//
//  IpefixeTextField.swift
//  Animations
//
//  Created by Kevin Boulala on 21/02/2025.
//

import SwiftUI

struct IpefixeTextField: View {
    @Binding var text: String
    var placeholder: String
    @FocusState private var isFocused: Bool
    
    init(value: Binding<String>, placeholder: String) {
        self._text = value
        self.placeholder = placeholder
    }
    
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 10)
                .fill(.gray)
                .stroke(.teal, lineWidth: isFocused ? 3 : 0)
            Text(placeholder)
                .foregroundStyle(.white.opacity(0.4))
                .padding(.horizontal, 20)
                .opacity(text.isEmpty ? 1 : 0)
            TextField("", text: $text)
                .padding(.horizontal, 20)
                .focused($isFocused)
        }
        .animation(.easeIn(duration: 0.3), value: text)
        .animation(.interactiveSpring(duration: 0.3), value: isFocused)
        .frame(maxWidth: .infinity, maxHeight: 40)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        @State var stringValue: String = ""
        IpefixeTextField(value: $stringValue, placeholder: "Enter something")
            .padding()
    }
}
