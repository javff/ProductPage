//
//  SwiftUIView.swift
//  
//
//  Created by Juan Andres Vasquez Ferrer on 04-01-22.
//

import SwiftUI
import SDWebImageSwiftUI

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
                    WebImage(url:  URL(string: "\(images[index])"))
                        .resizable() 
                        .indicator(.activity)
                        .transition(.fade(duration: 0.5))
                        .scaledToFit()
                        .tag(index)
                        .onTapGesture {
                            tapHandler?()
                        }
                }
            }
            .frame(width: reader.size.width, height: reader.size.height, alignment: .center)
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        }
    }
}
