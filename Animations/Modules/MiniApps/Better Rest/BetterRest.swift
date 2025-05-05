//
//  BetterRest.swift
//  Animations
//
//  Created by Kevin Boulala on 14/02/2025.
//

import SwiftUI
import CoreML

struct BetterRest: View {
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    @State private var idealBedTime: Date?
    
    static private var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? .now
    }
    
    var body: some View {
        Form {
            userInputs
            result
        }
        .navigationTitle("BetterRest")
        .navigationBarTitleDisplayMode(.large)
        .alert(alertTitle, isPresented: $showingAlert) {
            Button("OK") { }
        } message: {
            Text(alertMessage)
        }
        .onAppear {
            calculateBedTime()
        }
    }
    
    private var userInputs: some View {
        Section {
            VStack(alignment: .leading, spacing: 0) {
                Text("When do you want to wake up?")
                    .font(.headline)
                DatePicker("", selection: $wakeUp, displayedComponents: .hourAndMinute)
                    .onChange(of: wakeUp) { _, _ in
                        calculateBedTime()
                    }
            }
            
            VStack(alignment: .leading, spacing: 0) {
                Text("Desired amount of sleep")
                    .font(.headline)
                Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                    .onChange(of: sleepAmount) { _, _ in
                        calculateBedTime()
                    }
            }
            
            VStack(alignment: .leading, spacing: 0) {
                Text("Daily coffee intake")
                    .font(.headline)
                Stepper("\(coffeeAmount) cup\(coffeeAmount > 1 ? "s" : "")", value: $coffeeAmount, in: 0...10, step: 1)
                    .onChange(of: coffeeAmount) { _, _ in
                        calculateBedTime()
                    }
            }
        }
    }
    
    private var result: some View {
        Section {
            VStack(alignment: .center, spacing: 0) {
                Text("Your ideal bedtime is...")
                Text("\(idealBedTime?.formatted(date: .omitted, time: .shortened) ?? " ")")
                    .font(.title)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
    
    private func calculateBedTime() {
        do {
            let config = MLModelConfiguration()
            let model = try BetterRestMLModel(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            
            idealBedTime = wakeUp - prediction.actualSleep
        } catch {
            alertTitle = "Error"
            alertMessage = "Sorry, there was a problem calculating your bedtime"
            showingAlert = true
        }
    }
}

#Preview {
    BetterRest()
}
