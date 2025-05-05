//
//  FunctionsFromFunctionsView.swift
//  Animations
//
//  Created by Kevin Boulala on 20/02/2025.
//

import SwiftUI

struct FunctionsFromFunctionsView: View {
    var body: some View {
        ChallengeTemplate(
            title: "Functions from functions",
            description: "Write a function that returns a function. The returned function should accept a string, and print whatever that string is.",
            assertions: [
                ChallengeAssertion(
                    condition: {
                        let example = createFunction()
                        return example("Hello, world!") == "Hello, world!"
                    },
                    textCondition: "let example = createFunction()\nreturn example(\"Hello, world!\") == \"Hello, world!\""
                )
            ]
        )
    }
    
    // 17:58
    // 17:59
    private func createFunction() -> (String) -> String {
        return { $0 }
    }
}

#Preview {
    FunctionsFromFunctionsView()
}
