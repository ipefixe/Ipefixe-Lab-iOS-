//
//  DifferentTypesNavigationView.swift
//  Animations
//
//  Created by Kevin Boulala on 14/02/2025.
//

import SwiftUI

struct DifferentTypesNavigationView: View {
    var body: some View {
//        NavigationStack {
            List {
                ForEach(0..<5) { i in
                    NavigationLink("Select Number: \(i)", value: i)
                }
                ForEach(0..<5) { i in
                    NavigationLink("Select String: \(i)", value: String(i))
                }
            }
            .navigationDestination(for: Int.self) { selection in
                Text("You selected the number \(selection)")
            }
            .navigationDestination(for: String.self) { selection in
                Text("You selected the string \(selection)")
            }
//        }
    }
}

#Preview {
    DifferentTypesNavigationView()
}
