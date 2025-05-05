//
//  InPlaceReversalView.swift
//  Animations
//
//  Created by Kevin Boulala on 21/02/2025.
//

import SwiftUI

struct InPlaceReversalView: View {
    var body: some View {
        ChallengeTemplate(
            title: "In-place reversal",
            description: "Write a function that reverses an integer array in place with O(1) space complexity – that means without allocating any space to store a new array, but instead moving values around your input array. You cannot use the built-in **reverse()** method; you need to write this one yourself.\n\n**Tip:** You need to use **inout** for the function parameter.",
            assertions: [
                ChallengeAssertion(
                    condition: {
                        var input = [1, 3, 5, 7]
                        reverse(&input)
                        return input == [7, 5, 3, 1]
                    },
                    textCondition: "var input = [1, 3, 5, 7]\nreverse(&input)\nreturn input == [7, 5, 3, 1]"
                ),
                ChallengeAssertion(
                    condition: {
                        var input = [2, 4, 6, 8]
                        reverse(&input)
                        return input == [8, 6, 4, 2]
                    },
                    textCondition: "var input = [2, 4, 6, 8]\nreverse(&input)\nreturn input == [8, 6, 4, 2]"
                ),
                ChallengeAssertion(
                    condition: {
                        var input = [10, 20, 30, 40, 50]
                        reverse(&input)
                        return input == [50, 40, 30, 20, 10]
                    },
                    textCondition: "var input = [10, 20, 30, 40, 50]\nreverse(&input)\nreturn input == [50, 40, 30, 20, 10]"
                ),
                ChallengeAssertion(
                    condition: {
                        var input = [1, 1, 2, 2, 1, 1]
                        reverse(&input)
                        return input == [1, 1, 2, 2, 1, 1]
                    },
                    textCondition: "var input = [1, 1, 2, 2, 1, 1]\nreverse(&input)\nreturn input == [1, 1, 2, 2, 1, 1]"
                )
            ]
        )
    }
    
    // 13:16
    // 13:20
    private func reverse(_ array: inout [Int]) {
        for i in 0..<array.count {
            guard let last = array.popLast() else { return }
            array.insert(last, at: i)
        }
    }
}

#Preview {
    InPlaceReversalView()
}
