//
//  FindMajorityValueView.swift
//  Animations
//
//  Created by Kevin Boulala on 21/02/2025.
//

import SwiftUI

struct FindMajorityValueView: View {
    var body: some View {
        ChallengeTemplate(
            title: "Find the majority value",
            description: "Write a function that accepts an array of integers and returns the number that occurs more than half the time. There will always be at least one such number in the array, but your function must have O(1) space complexity.",
            assertions: [
                ChallengeAssertion(
                    condition: { majorityValue(in: [1, 2, 2, 3]) == 2 },
                    textCondition: "majorityValue(in: [1, 2, 2, 3]) == 2"
                ),
                ChallengeAssertion(
                    condition: { majorityValue(in: [1, 2, 3, 2]) == 2 },
                    textCondition: "majorityValue(in: [1, 2, 3, 2]) == 2"
                ),
                ChallengeAssertion(
                    condition: { majorityValue(in: [1, 2, 2, 2, 3]) == 2 },
                    textCondition: "majorityValue(in: [1, 2, 2, 2, 3]) == 2"
                ),
                ChallengeAssertion(
                    condition: { majorityValue(in: [1, 2, 2, 3, 3, 3]) == 3 },
                    textCondition: "majorityValue(in: [1, 2, 2, 3, 3, 3]) == 3"
                ),
                ChallengeAssertion(
                    condition: { majorityValue(in: [1, 2, 1, 2, 1]) == 1 },
                    textCondition: "majorityValue(in: [1, 2, 1, 2, 1]) == 1"
                ),
                ChallengeAssertion(
                    condition: { majorityValue(in: [1, 2, 2, 2, 1]) == 2 },
                    textCondition: "majorityValue(in: [1, 2, 2, 2, 1]) == 2"
                )
            ]
        )
    }
    
    // 14:27
    // 14:32
    func majorityValue(in numbers: [Int]) -> Int {
        let sortedNumbers = numbers.sorted()
        var winner = sortedNumbers[0]
        var count = 0
        for number in sortedNumbers {
            if count == 0 {
                winner = number
            }
            if winner == number {
                count += 1
            } else {
                count -= 1
            }
        }
        return winner
    }
}

#Preview {
    FindMajorityValueView()
}
