//
//  ImageFromRemote.swift
//  Animations
//
//  Created by Kevin Boulala on 17/02/2025.
//

import SwiftUI

struct ImageFromRemote: View {
    
    private let urlString = "https://avatars.githubusercontent.com/u/6036136"
    
    var body: some View {
        VStack {
            TitleAppearance(title: "Image from remote server")
            List {
                Text("AsyncImage resizable with a specific size")
                    .font(.headline)
                AsyncImage(url: URL(string: urlString)) { image in
                    image
                        .resizable()
                        .frame(width: 100, height: 100)
                } placeholder: {
                    ImageProgressiveView
                }
                
                Text("AsyncImage Phase (OK)")
                    .font(.headline)
                AsyncImage(url: URL(string: urlString)) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .scaledToFit()
                    } else if phase.error != nil {
                        Text("There was an error loading the image.")
                    } else {
                        ImageProgressiveView
                    }
                }
                
                Text("AsyncImage Phase (Error, wrong URL)")
                    .font(.headline)
                AsyncImage(url: URL(string: "123")) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .scaledToFit()
                    } else if phase.error != nil {
                        Text("There was an error loading the image.")
                            .font(.caption)
                            .foregroundStyle(.red)
                    } else {
                        ImageProgressiveView
                    }
                }
                
                Text("AsyncImage scale 4")
                    .font(.headline)
                AsyncImage(url: URL(string: urlString), scale: 4)

                Text("AsyncImage alone")
                    .font(.headline)
                AsyncImage(url: URL(string: urlString))
            }
        }
    }
    
    private var ImageProgressiveView: some View {
        ZStack {
            Circle()
                .fill(.cyan)
                .frame(width: 50)
                .blur(radius: 10)
                .overlay {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                        .tint(.red)
                        .scaleEffect(CGSize(width: 3.0, height: 3.0))
                }
        }
        .frame(width: 100, height: 100)
    }
}

#Preview {
    ImageFromRemote()
}
