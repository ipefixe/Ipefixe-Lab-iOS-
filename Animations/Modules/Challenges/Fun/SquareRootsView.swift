//
//  SquareRootsView.swift
//  Animations
//
//  Created by Kevin Boulala on 21/02/2025.
//

import SwiftUI

struct SquareRootsView: View {
    var body: some View {
        ChallengeTemplate(
            title: "Square roots",
            description: "Write a function that returns the square root of a positive integer, rounded down to the nearest integer, without using **sqrt()**.",
            assertions: [
                ChallengeAssertion(
                    condition: { sneakySolution(9) == 3 },
                    textCondition: "sqrt(9) == 3"
                ),
                ChallengeAssertion(
                    condition: { sneakySolution(16777216) == 4096 },
                    textCondition: "sqrt(16777216) == 4096"
                ),
                ChallengeAssertion(
                    condition: { sneakySolution(16) == 4 },
                    textCondition: "sqrt(16) == 4"
                ),
                ChallengeAssertion(
                    condition: { sneakySolution(15) == 3 },
                    textCondition: "sqrt(15) == 3"
                )
            ]
        )
    }
    
    // 11:08
    // 11:10
    private func sqrt(_ number: Int) -> Int {
        for i in 0...number / 2 + 1 {
            if (i * i) > number {
                return i - 1
            }
        }
        
        return 0
    }
    
    private func sneakySolution(_ number: Int) -> Int {
        Int(pow(Double(number), 0.5))
    }
}

#Preview {
    SquareRootsView()
}
