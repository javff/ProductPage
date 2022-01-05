//
//  FullScreenElementView.swift
//  
//
//  Created by Juan Andres Vasquez Ferrer on 04-01-22.
//

import SwiftUI

struct FullScreenElementView: View {
    
    let images: [String]
    
    @Environment(\.presentationMode) var presentationMode
    
    @Binding var currentStep: Int
    
    private var stepperText: String {
        "\(currentStep + 1) / \(images.count)"
    }
    
    
    init(images: [String], currentStep: Binding<Int>) {
        self.images = images
        self._currentStep = currentStep
    }
    
    var body: some View {
        VStack {
            ZStack(alignment: .topLeading) {
                GalleryView(
                    images: images,
                    currentStep: $currentStep
                )
                    .onTapGesture { }
                    .gesture(
                        DragGesture(minimumDistance: 0, coordinateSpace: .local)
                            .onEnded({ value in
                                guard value.translation.height > 0 else { return }
                                presentationMode.wrappedValue.dismiss()
                            })
                    )
                StepperView(text: stepperText)
                    .padding(.horizontal, 10)
                
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black.opacity(0.8))
    }
}
