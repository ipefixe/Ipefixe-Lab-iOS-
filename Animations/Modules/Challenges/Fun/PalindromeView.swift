//
//  PalindromeView.swift
//  Animations
//
//  Created by Kevin Boulala on 19/02/2025.
//

import SwiftUI

struct PalindromeView: View {
    var body: some View {
        ChallengeTemplate(
            title: "Is a string a palindrome?",
            description: "Write a function that accepts a **String** as its only parameter, and returns true if the string reads the same when reversed, ignoring case.\n\n**Note:** Many people have reported this question being stated as using integer input instead, but that's only a minor variation.",
            assertions: [
                ChallengeAssertion(
                    condition: { isPalindrome(string: "rotator") },
                    textCondition: "isPalindrome(string: \"rotator\")"
                ),
                ChallengeAssertion(
                    condition: { isPalindrome(string: "Rats live on no evil star") },
                    textCondition: "isPalindrome(string: \"Rats live on no evil star\")"
                ),
                ChallengeAssertion(
                    condition: { isPalindrome(string: "Never odd or even") == false },
                    textCondition: "isPalindrome(string: \"Never odd or even\") == false"
                ),
                ChallengeAssertion(
                    condition: { isPalindrome(string: "Hello, world") == false },
                    textCondition: "isPalindrome(string: \"Hello, world\") == false"
                )
            ]
        )
    }
    
    private func isPalindrome(string: String) -> Bool {
        let lowercased = string.lowercased()
        let reversed = lowercased.reversed()
        return String(reversed) == lowercased
    }
}

#Preview {
    PalindromeView()
}
