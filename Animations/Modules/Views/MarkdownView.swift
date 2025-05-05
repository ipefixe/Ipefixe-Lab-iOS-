//
//  MarkdownView.swift
//  Animations
//
//  Created by Kevin Boulala on 19/02/2025.
//

import SwiftUI

struct MarkdownView: View {
    
    let markdownText: LocalizedStringKey = "This is a **variable** with *markdown* in it."
    
    var body: some View {
        VStack {
            TitleAppearance(title: "Markdown")
            Spacer()
            Text("This is regular text.")
            Text(verbatim: "This is regular text.")
                .foregroundStyle(.gray)
            Spacer()
            Text("This is **bold** text.")
            Text(verbatim: "This is **bold** text.")
                .foregroundStyle(.gray)
            Spacer()
            Text("This is *italic* text.")
            Text(verbatim: "This is *italic* text.")
                .foregroundStyle(.gray)
            Spacer()
            Text("This is ***bold, italic*** text.")
            Text(verbatim: "This is ***bold, italic*** text.")
                .foregroundStyle(.gray)
            Spacer()
            Text("~~A strikethrough example~~")
            Text(verbatim: "~~A strikethrough example~~")
                .foregroundStyle(.gray)
            Spacer()
            Text("`Monospaced works too`")
            Text(verbatim: "`Monospaced works too`")
                .foregroundStyle(.gray)
            Spacer()
            Text("Visit Apple: [click here](https://apple.com)")
                .tint(.red)
            Text(verbatim: "Visit Apple: [click here](https://apple.com)")
                .foregroundStyle(.gray)
            Spacer()
            Text(markdownText)
            Spacer()
        }
    }
}

#Preview {
    MarkdownView()
}
