//
//  BuscaWeatherView.swift
//  Animations
//
//  Created by Kevin Boulala on 19/03/2025.
//

import SwiftUI

enum WeatherType {
    /// 2 mm/h
    case lowRaining
    /// 2 mm/h to 7,6 mm/h
    case moderateRaining
    /// above 7,6 mm/h
    case heavyRaining
    /// Raining and a temperature between -5°C and 1°C
    case snowing
    /// No rain, and gust above 60km/h
    case windy
    /// Default
    case nothing
    
    var textSymbol: String {
        switch self {
        case .lowRaining: "🌦️"
        case .moderateRaining: "🌧️"
        case .heavyRaining: "⛈️"
        case .snowing: "🌨️"
        case .windy: "🌬️"
        case .nothing: "⛅️"
        }
    }
    
    var color: Color {
        switch self {
        case .lowRaining: Color.raining
        case .moderateRaining: Color.raining
        case .heavyRaining: Color.heavyRaining
        case .snowing: Color.snowing
        case .windy: Color.windy
        case .nothing: Color.weatherDefault
        }
    }
}

struct BuscaWeatherView: View {
    
    private let weather: WeatherType = [.lowRaining, .moderateRaining, .heavyRaining, .snowing, .windy, .nothing].randomElement() ?? .lowRaining
    private let rains = [0.2, 0.4, 0.6, 0.5, 0.4, 0.3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2.0, 3.3, 3.9, 7.2, 10, 18, 4, 3.3, 3.6]
    
    private let maxRainToDisplay = 15.2
    
    @State private var displayRainingDetail = false
    @State private var rainingDetail = ""
    
    var body: some View {
        ScrollView {
            TitleAppearance(title: "Busca \(weather.textSymbol)")
            last24hours
        }
        .scrollBounceBehavior(.basedOnSize)
    }
    
    private var last24hours: some View {
            ZStack() {
                LinearGradient(colors: [weather.color.opacity(0.6), weather.color.opacity(0.3)],
                               startPoint: .top,
                               endPoint: .bottom)
                    .clipShape(.rect(cornerRadius: 10))
                    .shadow(radius: 10)
                
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Last 24 Hours")
                            Rectangle()
                                .frame(height: 1)
                                .foregroundColor(weather.color)
                            last24hoursRaining
                    }
                    .padding()
            }
            .padding()
    }
    
    private var last24hoursRaining: some View {
        let factor = 8.0
        let bottomMargin = 12.0
        
        return VStack(alignment: .leading, spacing: 0) {
            Text("Raining (mm/hr)")
                .font(.caption)
            ZStack {
                HStack(alignment: .bottom, spacing: 0) {
                    last24hoursRainingYAxis
                        .frame(height: (maxRainToDisplay * factor) + bottomMargin)
                    last24hoursRainingValues
                        .padding(.bottom, bottomMargin)
                }
                if displayRainingDetail {
                    VStack {
                        Text(rainingDetail)
                            .font(.caption)
                            .padding(5)
                            .background(.blue.opacity(0.8))
                            .clipShape(.capsule)
                        Spacer()
                    }
                }
            }
        }
    }
    
    private var last24hoursRainingYAxis: some View {
        VStack {
            Text("\(maxRainToDisplay.formatted())")
                .font(.caption2)
            Spacer()
            Text("   0")
                .font(.caption2)
        }
    }
    
    private var last24hoursRainingValues: some View {
        ForEach(Array(rains.enumerated()), id: \.offset) { index, rain in
            ZStack(alignment: .bottom) {
                RoundedRectangle(cornerRadius: 2)
                    .fill(rain >= maxRainToDisplay ? Color.red : Color.blue)
                    .frame(width: 4, height: CGFloat(min(rain, maxRainToDisplay)) * 8.0)
                RoundedRectangle(cornerRadius: 2)
                    .fill(.white.opacity(0.001))
                    .frame(width: 12, height: CGFloat(maxRainToDisplay) * 8.0)
                    .gesture(DragGesture(minimumDistance: 0)
                        .onChanged { _ in
                            displayRainingDetail = true
                            tappedOnRain(index: index, value: rain)
                        }
                        .onEnded { _ in
                            displayRainingDetail = false
                        })
            }
        }
    }
    
    private func tappedOnRain(index: Int, value: Double) {
        rainingDetail = ""
        
        let realCount = 24 - (index + 1)
        
        if let dateSelected = Calendar.current.date(byAdding: .hour, value: -realCount, to: Date()) {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MM/dd/YYYY HH"
            let dateString = dateFormatter.string(from: dateSelected)
            rainingDetail = "\(dateString)h: "
        }
        
        rainingDetail += "\(value.formatted())mm/hr"
    }
}

#Preview {
    BuscaWeatherView()
}
