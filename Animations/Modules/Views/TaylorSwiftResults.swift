//
//  TaylorSwiftResults.swift
//  Animations
//
//  Created by Kevin Boulala on 18/02/2025.
//

import SwiftUI

fileprivate struct Response: Codable {
    var results: [Result]
}

fileprivate struct Result: Codable {
    var trackId: Int
    var trackName: String
    var collectionName: String
}

struct TaylorSwiftResults: View {
    
    @State private var results = [Result]()
    
    var body: some View {
        List(results, id: \.trackId) { item in
            VStack(alignment: .leading) {
                Text(item.trackName)
                    .font(.headline)
                Text(item.collectionName)
            }
        }
        .task {
            await loadData()
        }
    }
    
    func loadData() async {
        guard let url = URL(string:"https://itunes.apple.com/search?term=taylor+swift&entity=song") else {
            NSLog("‼️ Invalid URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
                results = decodedResponse.results
            }
        } catch {
            NSLog("‼️ Invalid data")
            return
        }
        
    }
}

#Preview {
    TaylorSwiftResults()
}
