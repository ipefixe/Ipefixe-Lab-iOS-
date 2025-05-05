//
//  NavigationLinkView.swift
//  Animations
//
//  Created by Kevin Boulala on 14/02/2025.
//

import SwiftUI

struct NavigationLinkView: View {
    var body: some View {
//        NavigationStack {
            List(0..<1000) { i in
                NavigationLink("Select \(i)", value: i)
            }
            .navigationDestination(for: Int.self) { selection in
                DetailView(number: selection)
            }
//        }
    }
}

fileprivate struct DetailView: View {
    
    var number: Int
    
    var body: some View {
        Text("Detail View \(number)")
    }
    
    init(number: Int) {
        self.number = number
        print("Creating detail view \(number)")
    }
}

#Preview {
    NavigationLinkView()
}
