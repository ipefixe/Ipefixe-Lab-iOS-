//
//  ListManipulationView.swift
//  Animations
//
//  Created by Kevin Boulala on 13/02/2025.
//

import SwiftUI

struct ListManipulationView: View {
    
    @State private var numbers = [Int]()
    @State private var currentNumber = 1
    
    var body: some View {
//        NavigationStack {
            VStack {
                TitleAppearance(title: "List Manipulation")
                    .padding()
                
                List {
                    ForEach(numbers, id: \.self) {
                        Text("Row \($0)")
                    }
                    .onDelete(perform: removeRow)
                }
                
                Button("Add Number", action: addRow)
                    .padding(.bottom, 40)
            }
            .toolbar {
                EditButton()
            }
//        }
    }
    
    private func addRow() {
        numbers.append(currentNumber)
        currentNumber += 1
    }
    
    private func removeRow(at indexSet: IndexSet) {
        numbers.remove(atOffsets: indexSet)
    }
}

#Preview {
    ListManipulationView()
}
