//
//  CountNumbersView.swift
//  Animations
//
//  Created by Kevin Boulala on 20/02/2025.
//

import SwiftUI

struct CountNumbersView: View {
    var body: some View {
        ChallengeTemplate(
            title: "Count the numbers",
            description: "Write a function that accepts an array of integers and returns the number of times a specific digit appears in any of its numbers.",
            assertions: [
                ChallengeAssertion(
                    condition: { count("5", in: [5, 15, 55, 515]) == 6 },
                    textCondition: "count(\"5\", in: [5, 15, 55, 515]) == 6"
                ),
                ChallengeAssertion(
                    condition: { count("1", in: [5, 15, 55, 515]) == 2 },
                    textCondition: "count(\"1\", in: [5, 15, 55, 515]) == 2"
                ),
                ChallengeAssertion(
                    condition: { count("5", in: [55555]) == 5 },
                    textCondition: "count(\"5\", in: [55555]) == 5"
                ),
                ChallengeAssertion(
                    condition: { count("1", in: [55555]) == 0 },
                    textCondition: "count(\"1\", in: [55555]) == 0"
                )
            ]
        )
    }
    
    // 16:10
    // 16:14
    private func count(_ numberToCount: String, in integersArray: [Int]) -> Int {
        let stringsArray = integersArray.map { String($0) }
        let string = stringsArray.joined(separator: "")
        let withoutTheNumber = string.replacingOccurrences(of: numberToCount, with: "")
        return string.count - withoutTheNumber.count
    }
}

#Preview {
    CountNumbersView()
}
