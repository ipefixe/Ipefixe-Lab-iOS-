//
//  FormExperimentationView.swift
//  Animations
//
//  Created by Kevin Boulala on 21/02/2025.
//

import SwiftUI

struct FormExperimentationView: View {
    
    @State private var textfieldValue: String = ""
    
    var body: some View {
        VStack {
            TitleAppearance(title: "Form Experimentation")
            Text("A new TextField")
            IpefixeTextField(value: $textfieldValue, placeholder: "Enter something")
            Text("What's inside? \(textfieldValue)")
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    FormExperimentationView()
}
