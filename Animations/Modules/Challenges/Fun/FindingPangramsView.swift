//
//  FindingPangramsView.swift
//  Animations
//
//  Created by Kevin Boulala on 20/02/2025.
//

import SwiftUI

struct FindingPangramsView: View {
    var body: some View {
        ChallengeTemplate(
            title: "Finding pangrams",
            description: "Write a function that returns true if it is given a string that is an English pangram, ignoring letter case.\n\n**Tip:** A pangram is a string that contains every letter of the alphabet at least once.",
            assertions: [
                ChallengeAssertion(
                    condition: { isPangram("The quick brown fox jumps over the lazy dog") },
                    textCondition: "isPangram(\"The quick brown fox jumps over the lazy dog\")"
                ),
                ChallengeAssertion(
                    condition: { isPangram("The quick brown fox jumped over the lazy dog") == false },
                    textCondition: "isPangram(\"The quick brown fox jumped over the lazy dog\") == false"
                )
            ]
        )
    }
    
    // 17:41
    // 17:50
    private func isPangram(_ text: String) -> Bool {
        let cleanText = text.lowercased().filter { $0 >= "a" && $0 <= "z" }
        let removeDupplicates = Set(cleanText)
        return removeDupplicates.count == 26
    }
}

#Preview {
    FindingPangramsView()
}
