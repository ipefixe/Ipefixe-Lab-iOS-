//
//  LettersUniqueView.swift
//  Animations
//
//  Created by Kevin Boulala on 19/02/2025.
//

import SwiftUI

struct LettersUniqueView: View {
    var body: some View {
        ChallengeTemplate(
            title: "Are the letters unique?",
            description: "Write a function that accepts a **String** as its only parameter, and returns true if the string has only unique letters, taking letter case into account.",
            assertions: [
                ChallengeAssertion(
                    condition: { smartSolution(in: "No duplicates") },
                    textCondition: "lettersAreUnique(in: \"No duplicates\"))"
                ),
                ChallengeAssertion(
                    condition: { smartSolution(in: "abcdefghijklmnopqrstuvwxyz") },
                    textCondition: "lettersAreUnique(in: \"abcdefghijklmnopqrstuvwxyz\"))"
                ),
                ChallengeAssertion(
                    condition: { smartSolution(in: "AaBbCc") },
                    textCondition: "lettersAreUnique(in: \"AaBbCc\"))"
                ),
                ChallengeAssertion(
                    condition: { smartSolution(in: "Hello, world") == false },
                    textCondition: "lettersAreUnique(in: \"Hello, world\") == false)"
                )
            ]
        )
    }
    
    private func lettersAreUnique(in text: String) -> Bool {
        var originalText = text
        for character in text {
            originalText.removeFirst()
            if originalText.contains(where: { $0 == character }) {
                return false
            }
        }
        return true
    }
    
    private func smartSolution(in text: String) -> Bool {
        Set(text).count == text.count
    }
}

#Preview {
    LettersUniqueView()
}
