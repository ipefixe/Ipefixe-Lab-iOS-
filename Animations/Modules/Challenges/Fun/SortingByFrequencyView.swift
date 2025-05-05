//
//  SortingByFrequencyView.swift
//  Animations
//
//  Created by Kevin Boulala on 21/02/2025.
//

import SwiftUI

struct SortingByFrequencyView: View {
    var body: some View {
        ChallengeTemplate(
            title: "Sorting by frequency",
            description: "Write a function that accepts an array of integers and returns them sorted so the least frequently occurring numbers come at the start. For a slightly harder challenge, upgrade your code to work with any kind of **Comparable** data, such as strings or dates.",
            assertions: [
                ChallengeAssertion(
                    condition: { sortByFrequency([1, 1, 1, 2, 2, 3]) == [3, 2, 2, 1, 1, 1] },
                    textCondition: "sortByFrequency([1, 1, 1, 2, 2, 3]) == [3, 2, 2, 1, 1, 1]"
                ),
                ChallengeAssertion(
                    condition: { sortByFrequency([1, 2, 1, 2, 3, 1]) == [3, 2, 2, 1, 1, 1] },
                    textCondition: "sortByFrequency([1, 2, 1, 2, 3, 1]) == [3, 2, 2, 1, 1, 1]"
                ),
                ChallengeAssertion(
                    condition: { sortByFrequency([1, 1, 1, 1, 1, 1]) == [1, 1, 1, 1, 1, 1] },
                    textCondition: "sortByFrequency([1, 1, 1, 1, 1, 1]) == [1, 1, 1, 1, 1, 1]"
                ),
                ChallengeAssertion(
                    condition: { sortByFrequency([3, 2, 1]) == [1, 2, 3] },
                    textCondition: "sortByFrequency([3, 2, 1]) == [1, 2, 3]"
                ),
                ChallengeAssertion(
                    condition: { sortByFrequency(["cat", "cat", "dog"]) == ["dog", "cat", "cat"] },
                    textCondition: "sortByFrequency([\"cat\", \"cat\", \"dog\"]) == [\"dog\", \"cat\", \"cat\"]"
                ),
                ChallengeAssertion(
                    condition: { sortByFrequency([3.1, 3.2, 3.1, 3.4]) == [3.2, 3.4, 3.1, 3.1] },
                    textCondition: "sortByFrequency([3.1, 3.2, 3.1, 3.4]) == [3.2, 3.4, 3.1, 3.1]"
                    
                )
            ]
        )
    }
    
    // 10:38
    // 10:53
    private func sortByFrequency<T: Comparable & Hashable>(_ items: [T]) -> [T] {
        var counts: [T: Int] = [:]
        
        for item in items {
            counts[item, default: 0] += 1
        }
        
        return items.sorted {
            let firstCount = counts[$0, default: 0]
            let secondCount = counts[$1, default: 0]
            
            if firstCount == secondCount {
                return $0 < $1
            } else {
                return firstCount < secondCount
            }
        }
    }
}

#Preview {
    SortingByFrequencyView()
}
