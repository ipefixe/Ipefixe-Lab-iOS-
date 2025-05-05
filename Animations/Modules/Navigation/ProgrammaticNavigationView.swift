//
//  ProgrammaticNavigationView.swift
//  Animations
//
//  Created by Kevin Boulala on 14/02/2025.
//

import SwiftUI

struct ProgrammaticNavigationView: View {
    
    @State private var path = [Int]()
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack(spacing: 20) {
                Button("Show 32") {
                    path = [32]
                }
                Button("Show 64") {
                    path.append(64)
                }
                Button("Show 32 then 64") {
                    path = [32, 64]
                }
            }
            .navigationDestination(for: Int.self) { selection in
                Text("You selected \(selection)")
            }
        }
    }
}

#Preview {
    ProgrammaticNavigationView()
}
