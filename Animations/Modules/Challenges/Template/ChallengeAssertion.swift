//
//  ChallengeAssertion.swift
//  Animations
//
//  Created by Kevin Boulala on 19/02/2025.
//

import SwiftUI

struct ChallengeAssertion: View, Hashable {
    var condition: () -> Bool
    var textCondition: LocalizedStringKey
    
    var body: some View {
        HStack {
            Text("\(condition() ? "🟢" : "🔴")")
            Text(textCondition)
        }
    }
    
    func hash(into hasher: inout Hasher) {
        let string = String(describing: textCondition)
        hasher.combine(string)
    }
    
    static func == (lhs: ChallengeAssertion, rhs: ChallengeAssertion) -> Bool {
        lhs.textCondition == rhs.textCondition
    }
}

#Preview {
    ChallengeAssertion(
        condition: { [true, false].randomElement() ?? true },
        textCondition: "**assert**(fizzBuzz(*1*) == \"*1*\")"
    )
}
