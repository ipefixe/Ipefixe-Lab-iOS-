//
//  FizzBuzzView.swift
//  Animations
//
//  Created by Kevin Boulala on 18/02/2025.
//

import SwiftUI

struct FizzBuzzView: View {

    var body: some View {
        ChallengeTemplate(
            title: "Fizz Buzz",
            description: "Write a function that accepts a positive integer, and returns “**Fizz**” if the number is evenly divisible by *3*, “**Buzz**” if it’s evenly divisible by *5*, “**Fizz Buzz**” if it’s evenly divisible by *3* and *5*, or the original number for all other cases.",
            assertions: [
                ChallengeAssertion(
                    condition: { fizzBuzz(1) == "1" },
                    textCondition: "fizzBuzz(*1*) == \"*1*\""
                ),
                ChallengeAssertion(
                    condition: { fizzBuzz(2) == "2" },
                    textCondition: "fizzBuzz(*2*) == \"*2*\""
                ),
                ChallengeAssertion(
                    condition: { fizzBuzz(3) == "Fizz" },
                    textCondition: "fizzBuzz(*3*) == \"*Fizz*\""
                ),
                ChallengeAssertion(
                    condition: { fizzBuzz(4) == "4" },
                    textCondition: "fizzBuzz(*4*) == \"*4*\""
                ),
                ChallengeAssertion(
                    condition: { fizzBuzz(5) == "Buzz" },
                    textCondition: "fizzBuzz(*5*) == \"*Buzz*\""
                ),
                ChallengeAssertion(
                    condition: { fizzBuzz(15) == "Fizz Buzz" },
                    textCondition: "fizzBuzz(*15*) == \"*Fizz Buzz*\""
                )
            ]
        )
    }
    
    private func fizzBuzz(_ value: Int) -> String {
        guard value >= 0 else { return "" }
        
        if value % 3 == 0 && value % 5 == 0 {
            return "Fizz Buzz"
        } else if value % 5 == 0 {
            return "Buzz"
        } else if value % 3 == 0 {
            return "Fizz"
        }
        return "\(value)"
    }
}

#Preview {
    FizzBuzzView()
}
