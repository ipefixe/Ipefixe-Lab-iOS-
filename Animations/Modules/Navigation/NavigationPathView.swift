//
//  NavigationPathView.swift
//  Animations
//
//  Created by Kevin Boulala on 14/02/2025.
//

import SwiftUI

struct NavigationPathView: View {
    
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                Text("Hello")
            }
            .toolbar {
                Button("Push 56") {
                    path.append(56)
                }
                Button("Push Hello") {
                    path.append("Hello")
                }
            }
            .navigationDestination(for: Int.self) { selection in
                Text("You selected the number \(selection)")
            }
            .navigationDestination(for: String.self) { selection in
                Text("You selected the string \(selection)")
            }
        }
    }
}

#Preview {
    NavigationPathView()
}
