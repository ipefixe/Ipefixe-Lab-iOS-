//
//  AnimationsApp.swift
//  Animations
//
//  Created by Kevin Boulala on 07/02/2025.
//

import SwiftData
import SwiftUI

@main
struct AnimationsApp: App {
    var body: some Scene {
        WindowGroup {
            SummaryView()
        }
        .modelContainer(for: Book.self)
    }
}
