//
//  LetterOccurencesUniqueView.swift
//  Animations
//
//  Created by Kevin Boulala on 19/02/2025.
//

import SwiftUI

struct LetterOccurencesUniqueView: View {
    var body: some View {
        ChallengeTemplate(
            title: "Are the letter occurrences unique?",
            description: "A common variation of the \"Are the letters unique?\" challenge is to check whether the letter *occurrences* are unique: when you count all the occurrences of each letter, is each count unique?",
            assertions: [
                ChallengeAssertion(
                    condition: { uniqueOccurences(in: "ABBCCCDDDD") },
                    textCondition: "uniqueOccurences(in: \"ABBCCCDDDD\"))"
                ),
                ChallengeAssertion(
                    condition: { uniqueOccurences(in: "AABACCCABD") },
                    textCondition: "uniqueOccurences(in: \"AABACCCABD\"))"
                ),
                ChallengeAssertion(
                    condition: { uniqueOccurences(in: "HELLO") == false },
                    textCondition: "uniqueOccurences(in: \"HELLO\") == false)"
                ),
                ChallengeAssertion(
                    condition: { uniqueOccurences(in: "HeLlO") == false },
                    textCondition: "uniqueOccurences(in: \"HeLlO\") == false)"
                )
            ]
        )
    }
    
    private func uniqueOccurences(in text: String) -> Bool {
        var occurrences = [Character: Int]()
        
        for letter in text {
            occurrences[letter, default: 0] += 1
        }
        
        return occurrences.values.count == Set(occurrences.values).count
    }
}

#Preview {
    LetterOccurencesUniqueView()
}
