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
    
    public var body: some View {
        ZStack(alignment: .topLeading) {
            GeometryReader { reader in
                    TabView(selection: $currentStep) {
                        ForEach(0..<images.count) { index in
                            AsyncImage(
                                url: URL(string: "\(images[index])"),
                                content: { image in
                                    image.resizable()
                                        .aspectRatio(contentMode: .fit)
                                },
                                placeholder: {
                                    ProgressView()
                                }
                            ).tag(index)
                        }
                    }
                    .frame(width: reader.size.width, height: reader.size.height, alignment: .center)
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                
                StepperView(text: stepperText)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: 300)
        .padding()
    }
}
