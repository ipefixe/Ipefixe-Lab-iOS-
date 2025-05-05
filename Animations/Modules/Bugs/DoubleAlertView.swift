//
//  DoubleAlertView.swift
//  Animations
//
//  Created by Kevin Boulala on 14/02/2025.
//

import SwiftUI

struct AlertIdentifier: Identifiable {
    enum Choice {
        case first, confirmation
    }
    
    var id: Choice
}

struct DoubleAlertView: View {
    
    @State var alertIdentifier: AlertIdentifier?
    
    var body: some View {
        VStack(spacing: 100) {
            TitleAppearance(title: "Alerts")
            Text("""
                 Having two alerts on one view can be an issue before iOS 16.
                 Not anymore an issue, since iOS 16.
                 
                 Before this version, one solution was to have an indentifier in a @State to select the AlertView we want to display.
                 """)
    
            Button("Click me", action: {
                alertIdentifier = AlertIdentifier(id: .first)
            })
            Spacer()
        }
        .padding()
        .alert(item: $alertIdentifier) { alert in
            switch alert.id {
            case .first:
                return Alert(title: Text("Important"),
                             message: Text("What is your choice?"),
                             primaryButton: .destructive(Text("Delete"),
                                                         action: {
                    alertIdentifier = AlertIdentifier(id: .confirmation)
                }),
                             secondaryButton: .cancel())
            case .confirmation:
                return Alert(title: Text("Second Alert"),
                             message: Text("This is the second alert"))
            }
        }
    }
}

#Preview {
    DoubleAlertView()
}
