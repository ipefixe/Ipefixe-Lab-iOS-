//
//  RandomNavigationView.swift
//  Animations
//
//  Created by Kevin Boulala on 14/02/2025.
//

import SwiftUI

struct RandomNavigationView: View {
    
    @State private var path = [Int]()
    // @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            DetailView(number: 0, path: $path)
                .navigationDestination(for: Int.self) { number in
                    DetailView(number: number, path: $path)
                }
        }
    }
}

fileprivate struct DetailView: View {
    
    var number: Int
    
    @Binding var path: [Int]

    var body: some View {
        NavigationLink("Go to Random Number", value: Int.random(in: 1...1000))
            .navigationTitle("Number: \(number)")
            .toolbar {
                if number != 0 {
                    Button("Home") {
                        path.removeAll()
                        //path = NavigationPath()
                    }
                }
            }
    }
}

#Preview {
    RandomNavigationView()
}
