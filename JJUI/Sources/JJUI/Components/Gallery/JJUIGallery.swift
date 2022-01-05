//
//  JJUIGallery.swift
//  
//
//  Created by Juan Andres Vasquez Ferrer on 03-01-22.
//

import SwiftUI

public struct JJUIGallery: View {

    public let images: [String]
    
    private var stepperText: String {
        "\(currentStep + 1) / \(totalSteps)"
    }
    
    @State var currentStep: Int = 0
    
    private var totalSteps: Int {
        images.count
    }
    
    public init(images: [String]) {
        self.images = images
    }
    
    @State private var isFullScreenPresented = false

    
    public var body: some View {
        ZStack(alignment: .topLeading) {
            
            GalleryView(images: images, currentStep: $currentStep) {
                isFullScreenPresented.toggle()
            }
            
            StepperView(text: stepperText)
        }
        .frame(maxWidth: .infinity, maxHeight: 300)
        .padding()
        .fullScreenCover(isPresented: $isFullScreenPresented) {
            FullScreenElementView(images: images, currentStep: $currentStep)
        }
    }

}
