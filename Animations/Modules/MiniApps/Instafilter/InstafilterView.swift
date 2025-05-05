//
//  InstafilterView.swift
//  Animations
//
//  Created by Kevin Boulala on 27/02/2025.
//

import CoreImage
import CoreImage.CIFilterBuiltins
import PhotosUI
import StoreKit
import SwiftUI
import ImageIO

struct InstafilterView: View {

    @State private var selectedItem: PhotosPickerItem?
    @State private var processedImage: Image?
    @State private var filterIntensity = 0.5
    @State private var currentFilter: CIFilter = CIFilter.sepiaTone()
    @State private var showingFilters = false
    
    @AppStorage("filterCount") private var filterCount = 0
    @Environment(\.requestReview) private var requestReview
    
    private let context = CIContext()

    var body: some View {
        VStack {
            Spacer()
            
            PhotosPicker(selection: $selectedItem, matching: .images) {
                if let processedImage {
                    processedImage
                        .resizable()
                        .scaledToFit()
                } else {
                    ContentUnavailableView("No Picture",
                                           systemImage: "photo.badge.plus",
                                           description: Text("Tap to import a photo"))
                }
            }
            .buttonStyle(.plain)
            .onChange(of: selectedItem, loadImage)
            
            Spacer()
            
            VStack {
                HStack {
                    Text("Intensity")
                        .opacity(selectedItem == nil ? 0.33 : 1)
                    Slider(value: $filterIntensity)
                        .onChange(of: filterIntensity, applyProcessing)
                }
                .padding(.vertical)
                
                HStack {
                    Button("Change Filter", action: changeFilter)
                    
                    Spacer()
                    
                    if let processedImage {
                        ShareLink(
                            item: processedImage,
                            preview: SharePreview("Instafilter image", image: processedImage)
                        ) {
                            Label("Share your photo!", systemImage: "square.and.arrow.up")
                        }
                    }
                }
            }
            .disabled(selectedItem == nil)
        }
        .padding([.horizontal, .bottom])
        .navigationTitle("InstaFilter")
        .confirmationDialog("Select a filter", isPresented: $showingFilters) {
            Button("Crystallize") { setFilter(CIFilter.crystallize()) }
            Button("Edges") { setFilter(CIFilter.edges()) }
            Button("Gaussian Blur") { setFilter(CIFilter.gaussianBlur()) }
            Button("Pixellate") { setFilter(CIFilter.pixellate()) }
            Button("Sepia Tone") { setFilter(CIFilter.sepiaTone()) }
            Button("Unsharp Mask") { setFilter(CIFilter.unsharpMask()) }
            Button("Vignette") { setFilter(CIFilter.vignette()) }
            Button("Cancel", role: .cancel) { }
        }
    }
    
    private func changeFilter() {
        showingFilters.toggle()
    }
    
    @MainActor private func setFilter(_ filter: CIFilter) {
        currentFilter = filter
        loadImage()
        
        filterCount += 1
        
        if filterCount >= 10 {
            requestReview()
            filterCount = 0
        }
    }
    
    private func loadImage() {
        Task {
            guard let imageData = try await selectedItem?.loadTransferable(type: Data.self),
                  let inputImage = UIImage(data: imageData),
                  let ciImage = CIImage(image: inputImage) else {
                processedImage = nil
                return
            }
            
            let ciImageOriented = ciImage.oriented(CGImagePropertyOrientation(inputImage.imageOrientation))
            currentFilter.setValue(ciImageOriented, forKey: kCIInputImageKey)
            applyProcessing()
        }
    }

    private func applyProcessing() {
        let inputKeys = currentFilter.inputKeys
        if inputKeys.contains(kCIInputIntensityKey) {
            currentFilter.setValue(filterIntensity, forKey:kCIInputIntensityKey)
        }
        if inputKeys.contains(kCIInputRadiusKey) {
            currentFilter.setValue(filterIntensity * 200, forKey: kCIInputRadiusKey)
        }
        if inputKeys.contains(kCIInputScaleKey) {
            currentFilter.setValue(filterIntensity * 10, forKey: kCIInputScaleKey)
        }
        
        guard let outputImage = currentFilter.outputImage else {
            return
        }
        
        guard let cgImage = context.createCGImage(outputImage, from: outputImage.extent) else {
            return
        }
        
        let uiImage = UIImage(cgImage: cgImage)
        processedImage = Image(uiImage: uiImage)
    }
}

extension CGImagePropertyOrientation {
    init(_ uiOrientation: UIImage.Orientation) {
        switch uiOrientation {
        case .up: self = .up
        case .upMirrored: self = .upMirrored
        case .down: self = .down
        case .downMirrored: self = .downMirrored
        case .left: self = .left
        case .leftMirrored: self = .leftMirrored
        case .right: self = .right
        case .rightMirrored: self = .rightMirrored
        @unknown default: self = .up
        }
    }
}

#Preview {
    InstafilterView()
}
