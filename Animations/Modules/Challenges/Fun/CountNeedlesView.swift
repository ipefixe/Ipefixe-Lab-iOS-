//
//  CountNeedlesView.swift
//  Animations
//
//  Created by Kevin Boulala on 19/02/2025.
//

import SwiftUI

struct CountNeedlesView: View {
    var body: some View {
        ChallengeTemplate(
            title: "Needles in a haystack",
            description: "Write a function that accepts two strings, a needle string and a haystack string. The function should return how often characters from the needle string occur in the haystack string. Each character will appear only once in the needle string, and your check should be case-sensitive.",
            assertions: [
                ChallengeAssertion(
                    condition: { count(needles: "Aa", in: "ABACA") == 3 },
                    textCondition: "count(needles: \"Aa\", in: \"ABACA\") == 3)"
                ),
                ChallengeAssertion(
                    condition: { count(needles: "abc", in: "abcabc") == 6 },
                    textCondition: "count(needles: \"abc\", in: \"abcabc\") == 6)"
                ),
                ChallengeAssertion(
                    condition: { count(needles: "a", in: "AAA") == 0 },
                    textCondition: "count(needles: \"a\", in: \"AAA\") == 0)"
                )
            ]
        )
    }
    
    private func count(needles: String, in haystack: String) -> Int {
        var count = 0
        let needles = Set(needles)
        
        for character in haystack {
            if needles.contains(character) {
                count += 1
            }
        }
        
        return count
    }
}

#Preview {
    CountNeedlesView()
}
