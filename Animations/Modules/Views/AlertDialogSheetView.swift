//
//  AlertDialogSheetView.swift
//  Animations
//
//  Created by Kevin Boulala on 27/02/2025.
//

import SwiftUI

struct AlertDialogSheetView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State private var isPresentedAlert = false
    @State private var isPresentedConfirmationDialog = false
    @State private var isPresentedSheet = false
    
    var body: some View {
        VStack(spacing: 40) {
            TitleAppearance(title: "Alert\nvs\nConf.Dialog\nvs\nSheet")
            Button("Alert") {
                isPresentedAlert.toggle()
            }
            Button("ConfirmationDialog") {
                isPresentedConfirmationDialog.toggle()
            }
            Button("Sheet") {
                isPresentedSheet.toggle()
            }
            Spacer()
        }
        .padding()
        .alert("Alert", isPresented: $isPresentedAlert) {
            Button("An other Okidak") {}
            Button("Okidak") {}
            Button("Delete", role: .destructive) {}
            Button("Cancel", role: .cancel) {}
        } message: {
            Text("This is an alert")
        }
        .confirmationDialog("ConfirmationDialog", isPresented: $isPresentedConfirmationDialog) {
            Button("An other Okidak") {}
            Button("Okidak") {}
            Button("Delete", role: .destructive) {}
            Button("Cancel", role: .cancel) {}
        } message: {
            Text("This is a confirmationDialog")
        }
        .sheet(isPresented: $isPresentedSheet) {
            rainbow(text: "This is a sheet")
        }
    }
    
    private func rainbow(text: String) -> some View {
        VStack {
            Image(systemName: "rainbow")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.horizontal, 100)
                .symbolRenderingMode(.multicolor)
                .symbolEffect(.variableColor.reversing)
            ZStack {
                Text(text)
                    .foregroundStyle(.cyan)
                    .font(.title)
                    .bold()
                    .blur(radius: 8)
                Text(text)
                    .font(.title)
                    .bold()
            }
            .offset(y: -40)
        }
    }
}

#Preview {
    AlertDialogSheetView()
}
