//
//  PhotoViewerView.swift
//  Animations
//
//  Created by Kevin Boulala on 10/03/2025.
//

import PhotosUI
import StoreKit
import SwiftUI

struct PhotoViewerView: View {
    
    @State private var pickerItem: PhotosPickerItem?
    @State private var selectedImage: Image?
    @State private var alreadyRequestReview = false
    
    @Environment(\.requestReview) private var requestReview
    
    var body: some View {
        VStack {
            TitleAppearance(title: "Photo Viewer")
            
            PhotosPicker(selection: $pickerItem, matching: .images) {
                Label(
                    "Select a\(selectedImage != nil ? " new " : " ")photo",
                    systemImage: "photo")
            }
            .padding()
            .onChange(of: pickerItem) {
                Task {
                    guard let newData = try await pickerItem?.loadTransferable(
                        type: Data.self),
                          let uiImage = UIImage(data: newData) else {
                        selectedImage = nil
                        return
                    }
                    
                    selectedImage = Image(uiImage: uiImage)
                }
            }
            
            Spacer()
            
            if let selectedImage {
                displayPhotoAndShare(selectedImage)
            } else {
                emptyView
            }
        }
    }
    
    private var emptyView: some View {
        ContentUnavailableView(
            "No image", systemImage: "photo",
            description: Text("You don't have any image selected yet.")
        )
        .padding(.bottom, 140)
    }
    
    private func displayPhotoAndShare(_ image: Image) -> some View {
        VStack {
            ZStack {
                image
                    .resizable()
                    .scaledToFit()
                    .blur(radius: 5)
                    .opacity(0.33)
                image
                    .resizable()
                    .scaledToFit()
                    .padding()
            }
            .animation(.default, value: image)
            
            Spacer()
            
            ShareLink(
                item: image,
                preview: SharePreview("Your beautiful photo", image: image)
            ) {
                Label("Tap to share", systemImage: "square.and.arrow.up")
            }
            .simultaneousGesture(TapGesture()
                .onEnded { _ in
                    if !alreadyRequestReview {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
                            alreadyRequestReview.toggle()
                            requestReview()
                        }
                    }
                })
            .padding(.bottom, 40)
        }
    }
}

#Preview {
    PhotoViewerView()
}
