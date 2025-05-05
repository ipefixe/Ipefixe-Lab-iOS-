//
//  RemovingDuplicateLettersView.swift
//  Animations
//
//  Created by Kevin Boulala on 19/02/2025.
//

import SwiftUI

struct RemovingDuplicateLettersView: View {
    var body: some View {
        ChallengeTemplate(
            title: "Removing duplicate letters",
            description: "Write a function that accepts a string as its input and returns the same string with duplicate letters removed, so that each letter appears only once.\n\n**Tip:** If you can solve this challenge without a **for-in** loop, you can consider it a Tricky difficulty rather than Fun.",
            assertions: [
                ChallengeAssertion(
                    condition: { removeDuplicateCharacters(in: "wombat") == "wombat" },
                    textCondition: "removeDuplicateCharacters(in: \"wombat\") == \"wombat\""
                ),
                ChallengeAssertion(
                    condition: { removeDuplicateCharacters(in: "hello") == "helo" },
                    textCondition: "removeDuplicateCharacters(in: \"hello\") == \"helo\""
                ),
                ChallengeAssertion(
                    condition: { removeDuplicateCharacters(in: "Mississippi") == "Misp" },
                    textCondition: "removeDuplicateCharacters(in: \"Mississippi\") == \"Misp\""
                )
            ]
        )
    }
    
    private func removeDuplicateCharacters(in string: String) -> String {
        var used = [Character]()
        for letter in string {
            if used.contains(letter) == false {
                used.append(letter)
            }
        }
        return String(used)
    }
    
    private func smartSolution(in string: String) -> String {
        let array = string.map(String.init)
        let set = NSOrderedSet(array: array)
        let letters = Array(set) as! Array<String>
        return letters.joined()
    }
}

#Preview {
    RemovingDuplicateLettersView()
}
