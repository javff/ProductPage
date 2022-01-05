//
//  SwiftUIView.swift
//  
//
//  Created by Juan Andres Vasquez Ferrer on 04-01-22.
//

import SwiftUI

struct GalleryView: View {
    
    let images: [String]
    var tapHandler:(() -> Void)?
    @Binding var currentStep: Int
        
    init(images: [String], currentStep: Binding<Int>, tapHandler:(() -> Void)? = nil) {
        self.images = images
        self.tapHandler = tapHandler
        self._currentStep = currentStep
    }
    
    var body: some View {
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
                    )
                        .tag(index)
                        .onTapGesture {
                            tapHandler?()
                        }
                }
            }
            .frame(width: reader.size.width, height: reader.size.height, alignment: .center)
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        }
        .onAppear {
            currentStep = currentStep
        }
    }
}
