//
//  ChallengeTemplate.swift
//  Animations
//
//  Created by Kevin Boulala on 19/02/2025.
//

import SwiftUI

struct ChallengeTemplate: View {
    var title: String
    var description: LocalizedStringKey
    var assertions: [ChallengeAssertion]

    var body: some View {
        VStack {
            TitleAppearance(title: title)
            Text(description)
                .font(.subheadline)
            
            List {
                ForEach(assertions, id: \.self) { assertion in
                    assertion
                }
            }
            .scrollBounceBehavior(.basedOnSize)
        }
        .padding()
    }
}

#Preview {
    ChallengeTemplate(
        title: "Sample",
        description: "Some **description** here",
        assertions: [
            ChallengeAssertion(condition: { true }, textCondition: "**assert**(fizzBuzz(*1*) == \"*1*\")"),
            ChallengeAssertion(condition: { true }, textCondition: "**assert**(fizzBuzz(*1*) == \"*1*\")"),
            ChallengeAssertion(condition: { false }, textCondition: "**assert**(fizzBuzz(*1*) == \"*0*\")"),
            ChallengeAssertion(condition: { true }, textCondition: "**assert**(fizzBuzz(*1*) == \"*1*\")")
        ])
}
