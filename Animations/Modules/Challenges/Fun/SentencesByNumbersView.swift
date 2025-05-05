//
//  SentencesByNumbersView.swift
//  Animations
//
//  Created by Kevin Boulala on 21/02/2025.
//

import SwiftUI

struct SentencesByNumbersView: View {
    var body: some View {
        ChallengeTemplate(
            title: "Sentences by numbers",
            description: "Write a function that receives a string of space-separated words that end with a number in the range 1 through 9, and sends back the words as a single string, sorted by their number.\n\nFor example, \"morning2 good1 all4 to3\" should send back \"good morning to all\".",
            assertions: [
                ChallengeAssertion(
                    condition: { sort(sentence: "morning2 good1 all4 to3") == "good morning to all" },
                    textCondition: "sort(sentence: \"morning2 good1 all4 to3\") == \"good morning to all\""
                ),
                ChallengeAssertion(
                    condition: { sort(sentence: "world2 hello1") == "hello world" },
                    textCondition: "sort(sentence: \"world2 hello1\") == \"hello world\""
                ),
                ChallengeAssertion(
                    condition: { sort(sentence: "the1 rain2 in3 spain4") == "the rain in spain" },
                    textCondition: "sort(sentence: \"the1 rain2 in3 spain4\") == \"the rain in spain\""
                )
            ]
        )
    }
    
    // 13:28
    // 13:43
    private func sort(sentence: String) -> String {
        var splits = sentence.split(separator: " ")
        splits.sort { lhs, rhs in
            let lastLhs = Int(String(lhs.last ?? "0")) ?? 0
            let lastRhs = Int(String(rhs.last ?? "0")) ?? 0
            return lastLhs < lastRhs
        }
        return splits.map { String($0.dropLast()) }.joined(separator: " ")
        //return splits.joined(separator: " ").filter { !($0 >= "0" && $0 <= "9") }
    }
}

#Preview {
    SentencesByNumbersView()
}
