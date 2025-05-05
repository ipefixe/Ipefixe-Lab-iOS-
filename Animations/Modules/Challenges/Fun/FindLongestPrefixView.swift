//
//  FindLongestPrefixView.swift
//  Animations
//
//  Created by Kevin Boulala on 21/02/2025.
//

import SwiftUI

struct FindLongestPrefixView: View {
    var body: some View {
        ChallengeTemplate(
            title: "Find longest prefix",
            description: "Write a function that accepts a string of words with a similar prefix, separated by spaces, and returns the longest substring that prefixes all words.",
            assertions: [
                ChallengeAssertion(
                    condition: { longestPrefix(in: "swift switch swill swim") == "swi" },
                    textCondition: "longestPrefix(in: \"swift switch swill swim\") == \"swi\""
                ),
                ChallengeAssertion(
                    condition: { longestPrefix(in: "flip flap flop") == "fl" },
                    textCondition: "longestPrefix(in: \"flip flap flop\") == \"fl\""
                ),
                ChallengeAssertion(
                    condition: { longestPrefix(in: "hello world") == "" },
                    textCondition: "longestPrefix(in: \"hello world\") == \"\""
                )
            ]
        )
    }
    
    // 13:50
    // 14:04
    private func longestPrefix(in string: String) -> String {
        let splits = string.split(separator: " ")
        var prefix = String(splits.min { $0.count < $1.count } ?? "")
        
        while(!prefix.isEmpty) {
            var isPrefix = true
            splits.forEach { word in
                if !word.starts(with: prefix) {
                    isPrefix = false
                }
            }
            
            if isPrefix {
                return prefix
            }
            
            prefix.removeLast()
        }
        
        return prefix
    }
}

#Preview {
    FindLongestPrefixView()
}
