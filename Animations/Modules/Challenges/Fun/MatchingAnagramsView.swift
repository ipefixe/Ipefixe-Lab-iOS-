//
//  MatchingAnagramsView.swift
//  Animations
//
//  Created by Kevin Boulala on 20/02/2025.
//

import SwiftUI

struct MatchingAnagramsView: View {
    var body: some View {
        ChallengeTemplate(
            title: "Matching anagrams",
            description: "Create a function that accepts two strings, and returns true if the first string is an anagram of the second.\n\n**Tip:** Anagrams are rearrangements of the letters in a string, making sure to use all and only the original letters.",
            assertions: [
                ChallengeAssertion(
                    condition: { isAnagram("stone", for: "tones") },
                    textCondition: "isAnagram(\"stone\", for: \"tones\")"
                ),
                ChallengeAssertion(
                    condition: { isAnagram("madam", for: "madam") },
                    textCondition: "isAnagram(\"madam\", for: \"madam\")"
                ),
                ChallengeAssertion(
                    condition: { isAnagram("Madam", for: "madam") == false },
                    textCondition: "isAnagram(\"Madam\", for: \"madam\") == false"
                ),
                ChallengeAssertion(
                    condition: { isAnagram("hello", for: "world") == false },
                    textCondition: "isAnagram(\"hello\", for: \"world\")"
                )
            ]
        )
    }
    
    // 11:43
    // 11:44
    private func isAnagram(_ anagram: String, for word: String) -> Bool {
        let anagramSorted = anagram.sorted()
        let wordSorted = word.sorted()
        return anagramSorted == wordSorted
    }
}

#Preview {
    MatchingAnagramsView()
}
