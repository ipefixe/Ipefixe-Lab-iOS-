//
//  MatchingSocksView.swift
//  Animations
//
//  Created by Kevin Boulala on 21/02/2025.
//

import SwiftUI

struct MatchingSocksView: View {
    struct Sock {
        enum Size: String {
            case small, medium, large
        }
        enum Color: String {
            case white, black, red, blue
        }
        enum Material: String {
            case wool, cotton, silk
        }
        
        var size: Size
        var color: Color
        var material: Material
    }
    
    let socks = [
        Sock(size: .large, color: .black, material: .wool),
        Sock(size: .large, color: .red, material: .wool),
        Sock(size: .medium, color: .black, material: .cotton),
        Sock(size: .small, color: .black, material: .cotton),
    ]
    
    var body: some View {
        ChallengeTemplate(
            title: "Matching socks",
            description:
"""
Create a function that returns how many socks match a particular rule, such as how many socks are black, or how many socks are wool.

Assuming:
`let socks = [`
    `Sock(size: .large, color: .black, material: .wool),`
    `Sock(size: .large, color: .red, material: .wool),`
    `Sock(size: .medium, color: .black, material: .cotton),`
    `Sock(size: .small, color: .black, material: .cotton),`
`]`
""",
            assertions: [
                ChallengeAssertion(
                    condition: { count(socks, matching: "color", value: "black") == 3 },
                    textCondition: "count(socks, matching: \"color\", value: \"black\") == 3"
                ),
                ChallengeAssertion(
                    condition: { count(socks, matching: "color", value: "red") == 1 },
                    textCondition: "count(socks, matching: \"color\", value: \"red\") == 1"
                ),
                ChallengeAssertion(
                    condition: { count(socks, matching: "size", value: "large") == 2 },
                    textCondition: "count(socks, matching: \"size\", value: \"large\") == 2"
                )
            ]
        )
    }
    
    // 11:54
    // 12:00
    private func count(_ socks: [Sock], matching: String, value: String) -> Int {
        switch matching {
        case "size":
            socks.count { $0.size.rawValue == value }
        case "color":
            socks.count { $0.color.rawValue == value }
        case "material":
            socks.count { $0.material.rawValue == value }
        default:
            0
        }
    }
    
    private func count<T: Equatable>(_ socks: [Sock], matching rule: KeyPath<Sock, T>, value: T) -> Int {
        socks.count {
            $0[keyPath: rule] == value
        }
    }
}

#Preview {
    MatchingSocksView()
}
