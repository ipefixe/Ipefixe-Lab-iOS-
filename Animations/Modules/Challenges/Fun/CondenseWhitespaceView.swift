//
//  CondenseWhitespaceView.swift
//  Animations
//
//  Created by Kevin Boulala on 20/02/2025.
//

import SwiftUI

struct CondenseWhitespaceView: View {
    var body: some View {
        ChallengeTemplate(
            title: "Condense whitespace",
            description: "Write a function that accepts a **String**, and return it with any consecutive spaces replaced with a single space.",
            assertions: [
                ChallengeAssertion(
                    condition: { condenseWhitespace(in: "a   b   c") == "a b c" },
                    textCondition: "condenseWhitespace(in: \"a   b   c\") == \"a b c\""
                ),
                ChallengeAssertion(
                    condition: { condenseWhitespace(in: "  a") == " a" },
                    textCondition: "condenseWhitespace(in: \"  a\") == \" a\""
                ),
                ChallengeAssertion(
                    condition: { condenseWhitespace(in: "abc") == "abc" },
                    textCondition: "condenseWhitespace(in: \"abc\") == \"abc\""
                )
            ]
        )
    }
    
    // 16:25
    // 16:32
    private func condenseWhitespace(in string: String) -> String {
        var result = ""
        
        string.forEach { character in
            if result.isEmpty || !(result.hasSuffix(" ") && character == " ") {
                result = "\(result)\(character)"
            }
        }
        
        return result
    }
}

#Preview {
    CondenseWhitespaceView()
}
